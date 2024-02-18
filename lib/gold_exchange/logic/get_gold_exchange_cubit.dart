import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_task/gold_exchange/constants/enums/metal_type_enum.dart';
import 'package:flash_task/gold_exchange/data/api/errors/gold_api_error.dart';
import 'package:flash_task/gold_exchange/data/params/gold_exchange_params.dart';

import '../../common/functions/git_it_instance.dart';
import '../domain/entities/gold_exchange_entity.dart';
import '../domain/use_cases/get_gold_exchange_case.dart';

part 'get_gold_exchange_state.dart';

class GetGoldExchangeCubit extends Cubit<GetGoldExchangeState> {
  GetGoldExchangeCubit() : super(GetGoldExchangeInitial());

  // to try to fetch gold exchange
  void tryToFetchGoldExchange({
    required MetalType metalType,
    required String currencyCode,
  }) async {
    // loading
    _emitIfNotClosed(LoadingGoldExchange());

    // init params
    final params =
        GoldExchangeParams(metalType: metalType, currencyCode: currencyCode);

    // init useCase
    final useCase = getItInstance<GetGoldExchangeCase>();

    // send request
    final either = await useCase(params);

    // result
    either.fold(
      // error
      (error) => _emitIfNotClosed(ErrorWhileGodExchange(error: error)),

      //==> success
      (goldExchangeEntity) => _emitIfNotClosed(
          GoldExchangeFetched(goldExchangeEntity: goldExchangeEntity)),
    );
  }

  /// emit if not close
  void _emitIfNotClosed(GetGoldExchangeState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
