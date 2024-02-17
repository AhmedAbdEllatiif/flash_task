import 'dart:convert';
import 'dart:developer';

import 'package:flash_task/gold_price/data/api/errors/gold_api_error.dart';
import 'package:flash_task/gold_price/data/api/requests/get_gold_exchange_request.dart';
import 'package:flash_task/gold_price/data/models/gold_exchange_model.dart';
import 'package:flash_task/gold_price/data/params/gold_exchange_params.dart';


abstract class GoldDataSource {
  /// fetch the exchange rate for a Gold
  Future<dynamic> getLatestGoldExchangeRate(GoldExchangeParams params);
}

class GoldDataSourceImpl extends GoldDataSource {
  ///
  /// fetch the exchange for a Gold
  /// [params] the query params to be sent with the request
  ///
  @override
  Future getLatestGoldExchangeRate(GoldExchangeParams params) async {
    try {
          return exchangeGoldModelFromJson(jsonDecode("""
          {
    "timestamp": 1708149600,
    "metal": "XAU",
    "currency": "EGP",
    "exchange": "GOLDAPI",
    "symbol": "GOLDAPI:XAUEGP",
    "open_time": 1708041600,
    "price": 62113.5442,
    "ch": 277.033,
    "ask": 62126.964,
    "bid": 62100.1245,
    "price_gram_24k": 1996.9968,
    "price_gram_22k": 1830.5804,
    "price_gram_21k": 1747.3722,
    "price_gram_20k": 1664.164,
    "price_gram_18k": 1497.7476,
    "price_gram_16k": 1331.3312,
    "price_gram_14k": 1164.9148,
    "price_gram_10k": 832.082
}
          """));
      // init request
      final request = GetGoldExchangeRequest();

      // send a request
      final response = await request(params);

      log("getLatestGoldExchangeRate >> ResponseCode: ${response.statusCode}, Body:${response.body}");
      switch (response.statusCode) {
        // success
        case 200:
          return exchangeGoldModelFromJson(jsonDecode(response.body));
        // invalid api key
        case 403:
          return GoldApiError.noApiProvided;
        default:
          log("getLatestGoldExchangeRate >> ResponseCode: ${response.statusCode}, Body:${response.body}");
          return GoldApiError.defaultError;
      }
    } on Exception catch (e) {
      log("RemoteDataSource >> getLatestGoldExchangeRate >> Exception: $e");
      return GoldApiError.defaultError;
    }
  }
}
