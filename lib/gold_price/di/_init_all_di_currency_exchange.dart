import 'init_cubit.dart' as currency_cubit;
import 'init_datasource.dart' as data_source;
import 'init_remote_repos.dart' as remote_repo;
import 'init_usecases.dart' as uses_cases;

void initGoldExchangeDependencies()async{

  /// init data source
  data_source.init();

  /// init remote repository
  remote_repo.init();

  /// init cubit
  currency_cubit.init();

  /// init all use_cases
  uses_cases.init();
}