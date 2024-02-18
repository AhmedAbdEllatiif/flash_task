import 'dart:convert';
import 'dart:developer';

import 'package:flash_task/currency_exchange/data/api/errors/currency_api_error_type.dart';
import 'package:flash_task/currency_exchange/data/models/exchange_rate_model.dart';
import 'package:flash_task/currency_exchange/data/params/exchange_rate_params.dart';

import '../api/requests/get_exchange_rate_request.dart';
import '../models/exchange_series_model.dart';

abstract class CurrencyDataSource {
  /// fetch the exchange rate for a currency
  Future<dynamic> getLatestExchangeRate(ExchangeRateParams params);

  /// fetch time series of currency exchange
  Future<dynamic> getTimeSeriesExchange();
}

class CurrencyDataSourceImpl extends CurrencyDataSource {
  ///
  /// fetch the exchange rate for a currency
  /// [params] the query params to be sent with the request
  ///
  @override
  Future getLatestExchangeRate(ExchangeRateParams params) async {
    try {
       // init request
       final request = GetExchangeRateRequestRequest();

       // send a request
       final response = await request(params);

       switch (response.statusCode) {
         // success
         case 200:
           return exchangeModelFromJson(jsonDecode(response.body));
         // badAccessKey
         case 101:
           return CurrencyApiErrorType.badAccessKey;
         // quotaExceeded
         case 104:
           return CurrencyApiErrorType.quotaExceeded;
         // default
         default:
           log("getLatestExchangeRate >> ResponseCode: ${response.statusCode}, Body:${response.body}");
           return CurrencyApiErrorType.defaultError;
      }
    } on Exception catch (e) {
      log("RemoteDataSource >> getLatestExchangeRate >> Exception: $e");
      return CurrencyApiErrorType.defaultError;
    }
  }


  ///
  ///
  /// Fetch the currency exchange time series
  ///
  @override
  Future getTimeSeriesExchange() async {
    final json = jsonDecode("""
    {
    "rates": {
        "2023-01-01":{
          "EGP": 24.7509
        },
        "2023-02-01": {
          "EGP": 30.2057
        },
        "2023-03-01": {
          "EGP": 30.6264
        },
        "2023-04-01": {
          "EGP": 30.719
        },
        "2023-05-01": {
          "EGP": 31.0358
        },
        "2023-06-01": {
          "EGP": 30.9001
        },
        "2023-07-01": {
          "EGP": 30.883
        },
        "2023-08-01": {
          "EGP": 30.8963
        },
        "2023-09-01": {
          "EGP": 30.8738
        },
        "2023-10-01": {
          "EGP": 31.0485
        },
        "2023-11-01": {
          "EGP": 30.8904
        },
        "2023-12-01": {
          "EGP": 30.9056
        }
    }
}
    """);

    return currencyTimeSeriesExchangeFromJson(json);
  }
}
