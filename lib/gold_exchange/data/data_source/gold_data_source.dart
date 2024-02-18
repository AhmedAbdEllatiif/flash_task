import 'dart:convert';
import 'dart:developer';

import 'package:flash_task/gold_exchange/data/api/errors/gold_api_error.dart';
import 'package:flash_task/gold_exchange/data/api/requests/get_gold_exchange_request.dart';
import 'package:flash_task/gold_exchange/data/models/gold_exchange_model.dart';
import 'package:flash_task/gold_exchange/data/params/gold_exchange_params.dart';

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
      // init request
      final request = GetGoldExchangeRequest();

      // send a request
      final response = await request(params);

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
