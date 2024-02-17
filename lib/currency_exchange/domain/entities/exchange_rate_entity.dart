import 'dart:developer';

import 'package:equatable/equatable.dart';

class ExchangeRateEntity extends Equatable {
  final String date;
  final String baseCurrency;
  final Map<String, num> rates;
  late final String rateToEGP;

  ExchangeRateEntity({
    required this.date,
    required this.baseCurrency,
    required this.rates,
  }) {
    // init the rate to the egp pound
    rateToEGP = rates.containsKey("EGP") ? rates["EGP"].toString() : "";
    log(">>>>>>>>>>>\n rates: $rates");

  }

  @override
  List<Object?> get props => [date, rates];
}
