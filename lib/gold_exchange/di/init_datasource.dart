import '../../common/functions/git_it_instance.dart';
import '../data/data_source/gold_data_source.dart';

Future init() async {
  getItInstance.registerFactory<GoldDataSource>(
    () => GoldDataSourceImpl(),
  );
}
