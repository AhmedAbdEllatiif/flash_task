
import 'package:flash_task/currency_exchange/logic/get_exchange_rate_cubit.dart';

import '../../common/functions/git_it_instance.dart';

Future init() async {

  /// init [CurrencyRemoteRepo]
  getItInstance.registerFactory<GetExchangeRateCubit>(
        () => GetExchangeRateCubit(
    ),
  );
}
