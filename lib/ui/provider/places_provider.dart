import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infytel_test/core/model/place.dart';
import 'package:infytel_test/data/weather_api.dart';
import 'package:infytel_test/injection_containter.dart';

final placesProvider = FutureProvider<List<Place>>((ref) async {
  return await locator<WeatherApi>().getPlaces();
});
