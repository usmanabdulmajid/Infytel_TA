import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:infytel_test/core/model/weather_info.dart';
import 'package:infytel_test/core/model/place.dart';
import 'package:infytel_test/core/exception/exception.dart';
import 'package:infytel_test/data/weather_api_impl.dart';
import 'package:infytel_test/core/service/api_client.dart';

import 'mocks/api_client_mock.mocks.dart';

void main() {
  late MockApiClient mockClient;
  late WeatherApiImpl weatherApi;

  setUp(() {
    mockClient = MockApiClient();
    weatherApi = WeatherApiImpl(mockClient);
  });

  group('getInfo', () {
    test('returns WeatherInfo on success', () async {
      final mockResponse = {
        "location": {
          "name": "Lagos",
          "region": "",
          "country": "Nigeria",
          "lat": 0,
          "lon": 0,
          "tz_id": "",
          "localtime_epoch": 0,
          "localtime": "",
        },
        "current": {
          "last_updated_epoch": 0,
          "last_updated": "",
          "temp_c": 30.0,
          "temp_f": 86.0,
          "is_day": 1,
          "condition": {"text": "Sunny", "icon": "", "code": 1000},
          "wind_mph": 0,
          "wind_kph": 0,
          "wind_degree": 0,
          "wind_dir": "N",
          "pressure_mb": 1010,
          "pressure_in": 29.92,
          "precip_mm": 0,
          "precip_in": 0,
          "humidity": 70,
          "cloud": 10,
          "feelslike_c": 33.0,
          "feelslike_f": 91.4,
          "windchill_c": 0,
          "windchill_f": 0,
          "heatindex_c": 0,
          "heatindex_f": 0,
          "dewpoint_c": 0,
          "dewpoint_f": 0,
          "vis_km": 10,
          "vis_miles": 6,
          "uv": 5.0,
          "gust_mph": 0,
          "gust_kph": 0,
        },
      };

      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => ApiResponse(data: mockResponse, statusCode: 200),
      );

      final result = await weatherApi.getInfo('lagos');
      expect(result, isA<WeatherInfo>());
      expect(result.location.name, equals('Lagos'));
    });

    test('throws BaseException on failure', () async {
      when(
        mockClient.get(any, headers: anyNamed('headers')),
      ).thenAnswer((_) async => ApiResponse(error: 'error', statusCode: 500));

      expect(
        () => weatherApi.getInfo('invalid'),
        throwsA(isA<BaseException>()),
      );
    });
  });

  group('getPlaces', () {
    test('returns list of places', () async {
      final result = await weatherApi.getPlaces();
      expect(result, isA<List<Place>>());
      expect(result.length, greaterThan(5));
      expect(result.any((place) => place.name == 'Lagos'), isTrue);
    });
  });
}
