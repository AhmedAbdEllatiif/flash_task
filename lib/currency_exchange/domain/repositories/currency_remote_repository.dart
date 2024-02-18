import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flash_task/currency_exchange/data/api/errors/currency_api_error_type.dart';
import 'package:flash_task/currency_exchange/data/data_source/currency_data_source.dart';
import 'package:flash_task/currency_exchange/data/models/exchange_rate_model.dart';
import 'package:flash_task/currency_exchange/data/params/exchange_rate_params.dart';
import 'package:flash_task/currency_exchange/domain/entities/exchange_rate_entity.dart';

import '../../data/models/exchange_series_model.dart';
import '../entities/exchange_time_series.dart';

abstract class CurrencyRemoteRepo {
  ///
  /// To get exchange rate
  ///
  Future<Either<CurrencyApiErrorType, ExchangeRateEntity>> getExchangeRate(
      ExchangeRateParams params);

  ///
  /// To get time series exchange rate
  ///
  Future<Either<CurrencyApiErrorType, TimeSeriesExchangeEntity>>
      getTimeSeriesExchangeRate();
}

class CurrencyRemoteRepoImpl extends CurrencyRemoteRepo {
  final CurrencyDataSource dataSource;

  CurrencyRemoteRepoImpl({required this.dataSource});

  ///
  /// To get exchange rate
  ///
  @override
  Future<Either<CurrencyApiErrorType, ExchangeRateEntity>> getExchangeRate(
      ExchangeRateParams params) async {
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

  ///
  /// To get time series exchange rate
  ///
  @override
  Future<Either<CurrencyApiErrorType, TimeSeriesExchangeEntity>>
      getTimeSeriesExchangeRate() async {
    try {
      // send request
      final result = await dataSource.getTimeSeriesExchange();

      // success
      if (result is CurrencyTimeSeriesExchange) {
        return Right(result);
      }

      // failed
      else {
        return Left(result);
      }
    } on Exception catch (e) {
      log("getTimeSeriesExchangeRate >> getExchangeRate >> Error: $e");
      return const Left(CurrencyApiErrorType.defaultError);
    }
  }
}
