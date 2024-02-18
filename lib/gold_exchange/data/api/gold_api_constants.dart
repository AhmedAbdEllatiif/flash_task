import 'package:flash_task/common/classes/secret_manager.dart';

///
///  CurrencyApiBase
///
class GoldApiBase {
  // account Access key
  static String apiKey = SecretsManager.goldApiKey();

  // base url
  static const String baseUrl = 'www.goldapi.io';
}

///
///  GoldEndPoints
///  The available end points to use
///
class GoldEndPoints {
  static const String apiEndPoint = '/api/';
}
