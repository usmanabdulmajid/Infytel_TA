import 'package:flutter/material.dart';
import 'package:infytel_test/ui/screen/places_screen.dart';

class InfytelTestApp extends StatefulWidget {
  const InfytelTestApp({super.key});

  @override
  State<InfytelTestApp> createState() => _InfytelTestAppState();
}

class _InfytelTestAppState extends State<InfytelTestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infytel Technical Assesment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PlacesScreen(),
    );
  }
}
