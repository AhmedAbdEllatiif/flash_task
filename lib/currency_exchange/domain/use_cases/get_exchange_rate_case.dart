import 'package:dartz/dartz.dart';
import 'package:flash_task/currency_exchange/data/params/exchange_rate_params.dart';
import 'package:flash_task/currency_exchange/domain/entities/exchange_rate_entity.dart';
import 'package:flash_task/currency_exchange/domain/repositories/currency_remote_repository.dart';

import '../../data/api/errors/currency_api_error_type.dart';
import 'currency_use_case.dart';

///
/// To get the exchange rate
/// * return either: [CurrencyApiErrorType] or [ExchangeRateEntity]
///
class GetExchangeRateCase
    extends CurrencyUseCase<ExchangeRateEntity, ExchangeRateParams> {
  final CurrencyRemoteRepo remoteRepository;

  GetExchangeRateCase({required this.remoteRepository});

  @override
  Future<Either<CurrencyApiErrorType, ExchangeRateEntity>> call(
          ExchangeRateParams params) async =>
      await remoteRepository.getExchangeRate(params);
}
