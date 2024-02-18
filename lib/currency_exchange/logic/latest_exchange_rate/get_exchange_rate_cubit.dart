import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_task/currency_exchange/data/params/exchange_rate_params.dart';
import 'package:flash_task/currency_exchange/domain/entities/exchange_rate_entity.dart';
import 'package:flash_task/currency_exchange/domain/use_cases/get_exchange_rate_case.dart';

import '../../data/api/errors/currency_api_error_type.dart';

part 'get_exchange_rate_state.dart';

class GetExchangeRateCubit extends Cubit<GetExchangeRateState> {
  final GetExchangeRateCase useCase;

  GetExchangeRateCubit({required this.useCase})
      : super(GetExchangeRateInitial());

  // to try to fetch exchange rate
  void tryToFetchExchangeRate({
    required String baseCurrency,
    required List<String> rateCurrencies,
  }) async {
    // loading
    _emitIfNotClosed(LoadingExchangeRate());

    // init params
    final params = ExchangeRateParams(
      baseCurrency: baseCurrency,
      rateCurrencies: rateCurrencies,
    );

    // send request
    final either = await useCase(params);

    // result
    either.fold(
      // error
      (error) => _emitIfNotClosed(ErrorWhileExchangeRate(error: error)),

      //==> success
      (exchangeRateEntity) => _emitIfNotClosed(
          ExchangeRateFetched(exchangeRateEntity: exchangeRateEntity)),
    );
  }

  /// emit if not close
  void _emitIfNotClosed(GetExchangeRateState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
