import 'package:equatable/equatable.dart';

class GoldExchangeEntity extends Equatable {
  final int timestamp;
  final Map<String,num> prices;

  const GoldExchangeEntity({
    required this.timestamp,
    required this.prices,
  });


  @override
  List<Object?> get props => [timestamp];
}
