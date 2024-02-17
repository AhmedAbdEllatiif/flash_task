import 'dart:developer';

import 'package:flash_task/currency_exchange/data/api/errors/currency_api_error_type.dart';
import 'package:flash_task/currency_exchange/data/models/exchange_rate_model.dart';
import 'package:flash_task/currency_exchange/data/params/exchange_rate_params.dart';

abstract class CurrencyDataSource {
  /// fetch the exchange rate for a currency
  Future<dynamic> getLatestExchangeRate(ExchangeRateParams params);
}

class CurrencyDataSourceImpl extends CurrencyDataSource {
  ///
  /// fetch the exchange rate for a currency
  /// [params] the query params to be sent with the request
  ///
  @override
  Future getLatestExchangeRate(ExchangeRateParams params) async {
    try {
      return exchangeModelFromJson({});
      // // // init request
      // // final request = GetExchangeRateRequestRequest();
      // //
      // // // send a request
      // // final response = await request(params);
      // //
      // // log("getLatestExchangeRate >> ResponseCode: ${response.statusCode}, Body:${response.body}");
      // // switch (response.statusCode) {
      // //   // success
      // //   case 200:
      // //     return exchangeModelFromJson(jsonDecode(response.body));
      // //   // badAccessKey
      // //   case 101:
      // //     return CurrencyApiErrorType.badAccessKey;
      // //   // quotaExceeded
      // //   case 104:
      // //     return CurrencyApiErrorType.quotaExceeded;
      // //   // default
      // //   default:
      // //     log("getLatestExchangeRate >> ResponseCode: ${response.statusCode}, Body:${response.body}");
      // //     return CurrencyApiErrorType.defaultError;
      // }
    } on Exception catch (e) {
      log("RemoteDataSource >> getLatestExchangeRate >> Exception: $e");
      return CurrencyApiErrorType.defaultError;
    }
  }
}
