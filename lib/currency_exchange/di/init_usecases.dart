import 'package:flash_task/currency_exchange/domain/use_cases/get_exchange_rate_case.dart';

import '../../common/functions/git_it_instance.dart';
import '../domain/use_cases/time_series_exchange.dart';

Future init() async {
  /// init [GetExchangeRateCase]
  getItInstance.registerFactory<GetExchangeRateCase>(
    () => GetExchangeRateCase(remoteRepository: getItInstance()),
  );

  /// init [GetTimeSeriesExchangeRateCase]
  getItInstance.registerFactory<GetTimeSeriesExchangeRateCase>(
    () => GetTimeSeriesExchangeRateCase(remoteRepository: getItInstance()),
  );
}
