import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger();

  static void error(dynamic message) {
    if (kDebugMode) {
      _logger.e(message);
    }
  }

  static void debug(dynamic message) {
    if (kDebugMode) {
      _logger.d(message);
    }
  }

  static void info(dynamic message) {
    if (kDebugMode) {
      _logger.i(message);
    }
  }
}
