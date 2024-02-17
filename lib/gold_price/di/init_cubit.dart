import 'package:flash_task/gold_price/logic/get_gold_exchange_cubit.dart';

import '../../common/functions/git_it_instance.dart';

Future init() async {
  /// init [CurrencyRemoteRepo]
  getItInstance.registerFactory<GetGoldExchangeCubit>(
    () => GetGoldExchangeCubit(),
  );
}
