import 'package:flash_task/gold_price/domain/use_cases/get_gold_exchange_case.dart';

import '../../common/functions/git_it_instance.dart';

Future init() async {
  /// init [GetExchangeRateCase]
  getItInstance.registerFactory<GetGoldExchangeCase>(
    () => GetGoldExchangeCase(remoteRepository: getItInstance()),
  );
}
