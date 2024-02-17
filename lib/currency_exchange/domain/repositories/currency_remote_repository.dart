import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flash_task/currency_exchange/data/api/errors/currency_api_error_type.dart';
import 'package:flash_task/currency_exchange/data/data_source/currency_data_source.dart';
import 'package:flash_task/currency_exchange/data/models/exchange_rate_model.dart';
import 'package:flash_task/currency_exchange/data/params/exchange_rate_params.dart';
import 'package:flash_task/currency_exchange/domain/entities/exchange_rate_entity.dart';



abstract class CurrencyRemoteRepo {

  ///
  /// To get exchange rate
  ///
  Future<Either<CurrencyApiErrorType, ExchangeRateEntity>> getExchangeRate(
      ExchangeRateParams params);
}


class CurrencyRemoteRepoImpl extends CurrencyRemoteRepo{

  final CurrencyDataSource dataSource;

  CurrencyRemoteRepoImpl({required this.dataSource});

  ///
  /// To get exchange rate
  ///
  @override
  Future<Either<CurrencyApiErrorType, ExchangeRateEntity>> getExchangeRate(
      ExchangeRateParams params)async{
    try {
      // send request
      final result = await dataSource.getLatestExchangeRate(params);

      // success
      if (result is ExchangeRateModel) {
        return Right(result);
      }

      // failed
      else {
        return Left(result);
      }
    } on Exception catch (e) {
      log("CurrencyRemoteRepoImpl >> getExchangeRate >> Error: $e");
      return const Left(CurrencyApiErrorType.defaultError);
    }

  }
}