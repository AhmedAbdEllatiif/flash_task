part of 'get_gold_exchange_cubit.dart';

abstract class GetGoldExchangeState extends Equatable {
  const GetGoldExchangeState();

  @override
  List<Object> get props => [];
}

/// initial state
class GetGoldExchangeInitial extends GetGoldExchangeState {}

/// loading
class LoadingGoldExchange extends GetGoldExchangeState {}

/// success
class GoldExchangeFetched extends GetGoldExchangeState {
  final GoldExchangeEntity goldExchangeEntity;

  const GoldExchangeFetched({required this.goldExchangeEntity});

  @override
  List<Object> get props => [goldExchangeEntity];
}

/// invalid api key
class InvalidApiKeyGoldExchange extends GetGoldExchangeState {}

/// error
class ErrorWhileGodExchange extends GetGoldExchangeState {
  final GoldApiError error;

  const ErrorWhileGodExchange({required this.error});

  @override
  List<Object> get props => [error];
}
