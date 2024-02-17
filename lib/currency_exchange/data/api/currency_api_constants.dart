
///
///  CurrencyApiBase
///
class CurrencyApiBase {
  // account Access key
  static const String accessKey = '81cc93ac09343fb3976938b3eae8f1f5';

  // base url
  static const String baseUrl = 'api.exchangeratesapi.io';
}



///
///  CurrencyEndPoints
///  The available end points to use
///
class CurrencyEndPoints {

  // return the latest exchange rate data which gets
  // updated every 60 minutes, every 10 minutes, or every 60 seconds.
  static const String latest = '/v1/latest';
}



///
///  CurrencyParams
///  The params to use
///
class CurrencyParams {
  // account Access key
  static const String accessKey = 'access_key';
  static const String base = 'base';
  static const String symbols = 'symbols';

}