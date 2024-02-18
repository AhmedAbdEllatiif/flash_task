part of 'get_exchange_rate_cubit.dart';

abstract class GetExchangeRateState extends Equatable {
  const GetExchangeRateState();

  @override
  List<Object> get props => [];
}

/// initial state
class GetExchangeRateInitial extends GetExchangeRateState {}

/// loading
class LoadingExchangeRate extends GetExchangeRateState {}

/// success
class ExchangeRateFetched extends GetExchangeRateState {
  final ExchangeRateEntity exchangeRateEntity;

  const ExchangeRateFetched({required this.exchangeRateEntity});

  @override
  List<Object> get props => [exchangeRateEntity];
}

/// bad access key
class BadAccessKeyExchangeRate extends GetExchangeRateState {}

/// quota exceeded
class QuotaExceededExchangeRate extends GetExchangeRateState {}

/// error
class ErrorWhileExchangeRate extends GetExchangeRateState {
  final CurrencyApiErrorType error;

  const ErrorWhileExchangeRate({required this.error});

  @override
  List<Object> get props => [error];
}
