import 'package:flash_task/currency_exchange/data/api/currency_api_client.dart';
import 'package:flash_task/currency_exchange/data/api/currency_api_constants.dart';
import 'package:flash_task/currency_exchange/data/params/exchange_rate_params.dart';
import 'package:http/http.dart' as http;

import '../currency_raw_get_request.dart';


///
/// CompareCurrencyRequest
///
/// * This Request, depending on your subscription plan will
/// return real-time exchange rate data which gets updated every 60 minutes,
/// every 10 minutes, or every 60 seconds.
///
/// Example:
/// * {base_url}/latest?access_key=API_KEY&base=USD&symbols=GBP,JPY,EUR
///
class GetExchangeRateRequestRequest extends CurrencyRawGetRequest<ExchangeRateParams> {
  @override
  Future<http.Response> call(ExchangeRateParams params) async {
    var response = await initGetRequest(
      endPoint: CurrencyEndPoints.latest,
      queryParams: {
        CurrencyParams.accessKey: CurrencyApiBase.accessKey,
        CurrencyParams.base: params.baseCurrency,
        CurrencyParams.symbols: params.rateCurrencies,
      },
    );
    return response;
  }
}
