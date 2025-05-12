import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infytel_test/injection_containter.dart';
import '../../data/weather_api.dart';

final weatherInfoProvider = FutureProvider.family((ref, String id) async {
  return await locator<WeatherApi>().getInfo(id);
});
