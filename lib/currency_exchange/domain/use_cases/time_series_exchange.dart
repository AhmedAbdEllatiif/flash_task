import 'package:dartz/dartz.dart';
import 'package:flash_task/common/classes/no_params.dart';
import 'package:flash_task/currency_exchange/domain/entities/exchange_time_series.dart';
import 'package:flash_task/currency_exchange/domain/repositories/currency_remote_repository.dart';

import '../../data/api/errors/currency_api_error_type.dart';
import 'currency_use_case.dart';

///
/// To get the exchange rate
/// * return either: [CurrencyApiErrorType] or [TimeSeriesExchangeEntity]
///
class GetTimeSeriesExchangeRateCase
    extends CurrencyUseCase<TimeSeriesExchangeEntity, NoParams> {
  final CurrencyRemoteRepo remoteRepository;

  GetTimeSeriesExchangeRateCase({required this.remoteRepository});

  @override
  Future<Either<CurrencyApiErrorType, TimeSeriesExchangeEntity>> call(
          NoParams params) async =>
      await remoteRepository.getTimeSeriesExchangeRate();
}
