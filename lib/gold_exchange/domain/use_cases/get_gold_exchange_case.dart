import 'package:dartz/dartz.dart';
import 'package:flash_task/gold_exchange/data/api/errors/gold_api_error.dart';
import 'package:flash_task/gold_exchange/data/params/gold_exchange_params.dart';
import 'package:flash_task/gold_exchange/domain/entities/gold_exchange_entity.dart';

import '../repositories/gold_remote_repository.dart';
import 'gold_use_case.dart';

///
/// To get the exchange rate
/// * return either: [GoldApiError] or [GoldExchangeEntity]
///
class GetGoldExchangeCase
    extends GoldUseCase<GoldExchangeEntity, GoldExchangeParams> {
  /// remote repository
  final GoldRemoteRepo remoteRepository;

  GetGoldExchangeCase({required this.remoteRepository});

  @override
  Future<Either<GoldApiError, GoldExchangeEntity>> call(
          GoldExchangeParams params) async =>
      await remoteRepository.getGoldExchange(params);
}
