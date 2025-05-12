import 'package:infytel_test/core/exception/exception.dart';
import 'package:infytel_test/core/model/place.dart';
import 'package:infytel_test/core/model/weather_info.dart';
import 'package:infytel_test/core/service/api_client.dart';
import 'package:infytel_test/data/weather_api.dart';

class WeatherApiImpl implements WeatherApi {
  final ApiClient _client;
  WeatherApiImpl(this._client);
  @override
  Future<WeatherInfo> getInfo(String id) async {
    //TODO: revisit
    final response = await _client.get(
      'current.json?q=$id&key=dd4b14d604b143668f6114233251105',
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    if (response.isSuccess) {
      final weatherInfo = WeatherInfo.fromMap(response.data);
      return weatherInfo;
    } else {
      throw BaseException('Something went wrong', code: response.statusCode);
    }
  }

  @override
  Future<List<Place>> getPlaces() async {
    return Future.value([
      Place(id: 'abuja', name: 'Abuja'),
      Place(id: 'lagos', name: 'Lagos'),
      Place(id: 'kano', name: 'Kano'),
      Place(id: 'london', name: 'London'),
      Place(id: 'barcelona', name: 'Barcelona'),
      Place(id: 'manchester', name: 'Manchester'),
      Place(id: 'moscow', name: 'Moscow'),
      Place(id: 'cairo', name: 'Cairo'),
      Place(id: 'new york', name: 'New York'),
      Place(id: 'dubai', name: 'Dubai'),
    ]);
  }
}
