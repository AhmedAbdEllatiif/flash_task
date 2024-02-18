import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_task/common/classes/no_params.dart';
import 'package:flash_task/currency_exchange/domain/entities/exchange_time_series.dart';
import 'package:flash_task/currency_exchange/domain/use_cases/time_series_exchange.dart';

import '../../../common/functions/git_it_instance.dart';
import '../../data/api/errors/currency_api_error_type.dart';

part 'get_time_series_rate_state.dart';

class GetTimeSeriesRateCubit extends Cubit<GetTimeSeriesRateState> {
  GetTimeSeriesRateCubit() : super(TimeSeriesRateInitial());

  // to try to fetch timeSeries
  void tryToFetchTimeSeriesExchangeRate() async {
    // loading
    _emitIfNotClosed(LoadingTimeSeriesRate());

    // fake delay to simulate calling the server
    Future.delayed(const Duration(seconds: 1), () async {
      // init useCase
      final useCase = getItInstance<GetTimeSeriesExchangeRateCase>();

      // send request
      final either = await useCase(NoParams());

      // result
      either.fold(
        // error
        (error) => _emitIfNotClosed(ErrorWhileTimeSeriesRate(error: error)),

        //==> success
        (timeSeriesEntity) => _emitIfNotClosed(
            TimeSeriesRateFetched(timeSeriesRateEntity: timeSeriesEntity)),
      );
    });

    // init params
  }

  /// emit if not close
  void _emitIfNotClosed(GetTimeSeriesRateState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
