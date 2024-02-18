import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class SecretsManager {
  static const String _currencyAccessKey = 'CURRENCY_ACCESS_KEY';
  static const String _goldApiKey = 'GOLD_API_KEY';


  ///
  ///
  /// return the currency access key
  ///
  static String currencyAccessKey() {
    try {
      return dotenv.env[_currencyAccessKey] ?? "";
    } catch (e) {
      log("SecretsManager >> currencyAccessKey >> error: $e");
      return "";
    }
  }


  ///
  ///
  /// return the gold api key
  ///
  static String goldApiKey() {
    try {
      return dotenv.env[_goldApiKey] ?? "";
    } catch (e) {
      log("SecretsManager >> goldApiKey >> error: $e");
      return "";
    }
  }
}
