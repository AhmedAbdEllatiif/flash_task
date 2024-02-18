import 'package:equatable/equatable.dart';

class TimeSeriesExchangeEntity extends Equatable {
  final Map<String, num> rates;

  const TimeSeriesExchangeEntity({
    required this.rates,
  });

  @override
  List<Object?> get props => [rates];
}
