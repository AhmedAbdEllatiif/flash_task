import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flash_task/gold_price/data/api/errors/gold_api_error.dart';
import 'package:flash_task/gold_price/data/models/gold_exchange_model.dart';
import 'package:flash_task/gold_price/data/params/gold_exchange_params.dart';
import 'package:flash_task/gold_price/domain/entities/gold_exchange_entity.dart';

import '../../data/data_source/gold_data_source.dart';

abstract class GoldRemoteRepo {

  ///
  /// To get gold exchange rate
  ///
  Future<Either<GoldApiError, GoldExchangeEntity>> getGoldExchange(
      GoldExchangeParams params);
}


class GoldRemoteRepoImpl extends GoldRemoteRepo{

  final GoldDataSource dataSource;

  GoldRemoteRepoImpl({required this.dataSource});

  ///
  /// To get gold exchange rate
  ///
  @override
  Future<Either<GoldApiError, GoldExchangeEntity>> getGoldExchange(
      GoldExchangeParams params)async{
    try {
      // send request
      final result = await dataSource.getLatestGoldExchangeRate(params);

      // success
      if (result is GoldExchangeModel) {
        return Right(result);
      }

      // failed
      else {
        return Left(result);
      }
    } on Exception catch (e) {
      log("GoldRemoteRepoImpl >> getGoldExchange >> Error: $e");
      return const Left(GoldApiError.defaultError);
    }

  }
}