import 'package:logger/logger.dart';

class AppLog {

  final log = Logger();

  // Log a message at level verbose
  static void v(String message) {
    Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: true
      )
    ).v(message);
  }

  // Log a message at level debug
  static void d(String message) {
    Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 200,
        colors: true,
        printEmojis: true,
        printTime: true
      )
    ).d(message);
  }

  // Log a message at level info
  static void i(String message) {
    Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: true
      )
    ).i(message);
  }

  // Log a message at level warning
  static void w(String message) {
    Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: true
      )
    ).w(message);
  }

  // Log a message at level error
  static void e(String message) {
    Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        printTime: true
      )
    ).e(message);
  }

}