import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:infytel_test/core/exception/exception.dart';
import 'package:infytel_test/core/model/weather_info.dart';
import 'package:infytel_test/ui/provider/weather_info_provider.dart';

class WeatherInfoScreen extends StatelessWidget {
  final String id;
  const WeatherInfoScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather Info'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final weatherInfoAsyncValue = ref.watch(weatherInfoProvider(id));
            return weatherInfoAsyncValue.when(
              data: (WeatherInfo info) {
                return Column(
                  children: [
                    const Gap(16),
                    Text(info.location.name, style: TextStyle(fontSize: 24)),
                    const Gap(10),

                    Text('Latitude: ${info.location.lat}'),
                    const Gap(5),
                    Text('Longitude: ${info.location.lon}'),
                    const Gap(5),
                    Text('Humidity: ${info.current.humidity}'),

                    Image.network('https:${info.current.condition.icon}'),
                    Text(info.current.condition.text),
                  ],
                );
              },
              error: (error, stackTrace) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (error as BaseException).message,
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    ),
                    Gap(8),
                    IconButton(
                      onPressed: () => ref.refresh(weatherInfoProvider(id)),
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
