part of 'get_time_series_rate_cubit.dart';

abstract class GetTimeSeriesRateState extends Equatable {
  const GetTimeSeriesRateState();

  @override
  List<Object> get props => [];
}

/// initial state
class TimeSeriesRateInitial extends GetTimeSeriesRateState {}

/// loading
class LoadingTimeSeriesRate extends GetTimeSeriesRateState {}

/// success
class TimeSeriesRateFetched extends GetTimeSeriesRateState {
  final TimeSeriesExchangeEntity timeSeriesRateEntity;

  const TimeSeriesRateFetched({required this.timeSeriesRateEntity});

  @override
  List<Object> get props => [timeSeriesRateEntity];
}

/// error
class ErrorWhileTimeSeriesRate extends GetTimeSeriesRateState {
  final CurrencyApiErrorType error;

  const ErrorWhileTimeSeriesRate({required this.error});

  @override
  List<Object> get props => [error];
}
