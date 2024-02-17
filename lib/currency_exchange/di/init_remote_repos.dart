import 'package:flash_task/currency_exchange/domain/repositories/currency_remote_repository.dart';

import '../../common/functions/git_it_instance.dart';

Future init() async {

  /// init [CurrencyRemoteRepo]
  getItInstance.registerFactory<CurrencyRemoteRepo>(
    () => CurrencyRemoteRepoImpl(
      dataSource: getItInstance(),
    ),
  );
}
