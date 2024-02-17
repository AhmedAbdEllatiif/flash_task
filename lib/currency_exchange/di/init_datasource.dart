import 'package:flash_task/currency_exchange/data/data_source/currency_data_source.dart';

import '../../common/functions/git_it_instance.dart';

Future init() async {

  getItInstance.registerFactory<CurrencyDataSource>(
        () => CurrencyDataSourceImpl(),
  );
}
