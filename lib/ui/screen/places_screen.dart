import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infytel_test/core/model/place.dart';
import 'package:infytel_test/ui/provider/places_provider.dart';
import 'package:infytel_test/ui/screen/weather_info_screen.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Places'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final placesAsyncValue = ref.watch(placesProvider);
          return placesAsyncValue.when(
            data: (List<Place> places) {
              return ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  return ListTile(
                    title: Text(place.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WeatherInfoScreen(id: place.id);
                          },
                        ),
                      );
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error:
                (error, stackTrace) => Center(
                  child: Text(
                    'Error: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
          );
        },
      ),
    );
  }
}
