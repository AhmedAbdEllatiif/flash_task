import 'package:flash_task/currency_exchange/logic/latest_exchange_rate/get_exchange_rate_cubit.dart';

import '../../common/functions/git_it_instance.dart';
import '../logic/time_series_exchange_rate/get_time_series_rate_cubit.dart';

Future init() async {
  /// init latest exchange cubit
  getItInstance.registerFactory<GetExchangeRateCubit>(
    () => GetExchangeRateCubit(useCase: getItInstance()),
  );

  /// init timeSeries cubit
  getItInstance.registerFactory<GetTimeSeriesRateCubit>(
    () => GetTimeSeriesRateCubit(),
  );
}
