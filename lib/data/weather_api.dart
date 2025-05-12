import 'package:infytel_test/core/model/place.dart';
import 'package:infytel_test/core/model/weather_info.dart';

abstract class WeatherApi {
  Future<List<Place>> getPlaces();

  Future<WeatherInfo> getInfo(String id);
}
