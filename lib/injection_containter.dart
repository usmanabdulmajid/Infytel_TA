import 'package:get_it/get_it.dart';
import 'package:infytel_test/core/service/api_client.dart';
import 'package:infytel_test/data/weather_api.dart';
import 'package:infytel_test/data/weather_api_impl.dart';

final locator = GetIt.I;

Future<void> setup() async {
  final client = ApiClient('https://api.weatherapi.com/v1/');
  locator
    ..registerLazySingleton<ApiClient>(() => client)
    ..registerLazySingleton<WeatherApi>(() => WeatherApiImpl(client));
}
