import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(printer: CustomLogPrinter());

class CustomLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    if (kReleaseMode) return [];
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    final color = PrettyPrinter.defaultLevelColors[event.level];
    final message = event.message;
    return [color!('$emoji : $message')];
  }
}
