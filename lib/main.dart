import 'package:flutter/material.dart';
import 'package:infytel_test/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infytel_test/injection_containter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(ProviderScope(child: const InfytelTestApp()));
}
