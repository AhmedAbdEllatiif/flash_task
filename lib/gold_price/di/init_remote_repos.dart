import '../../common/functions/git_it_instance.dart';
import '../domain/repositories/gold_remote_repository.dart';

Future init() async {
  /// init [CurrencyRemoteRepo]
  getItInstance.registerFactory<GoldRemoteRepo>(
    () => GoldRemoteRepoImpl(
      dataSource: getItInstance(),
    ),
  );
}
