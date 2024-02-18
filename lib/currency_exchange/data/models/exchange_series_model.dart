import 'package:intl/intl.dart';

import '../../domain/entities/exchange_time_series.dart';

CurrencyTimeSeriesExchange currencyTimeSeriesExchangeFromJson(
        Map<String, dynamic> json) =>
    CurrencyTimeSeriesExchange.fromJson(json);

class CurrencyTimeSeriesExchange extends TimeSeriesExchangeEntity {
  final Map<String, num> modelRates;

  const CurrencyTimeSeriesExchange({
    required this.modelRates,
  }) : super(
          rates: modelRates,
        );

  // Factory method to create an instance of CurrencyTimeSeriesExchange from JSON
  factory CurrencyTimeSeriesExchange.fromJson(Map<String, dynamic> json) {
    final Map<String, num> rates = Map.fromEntries(
      (json["rates"] as Map).entries.map(
            (entry) => MapEntry<String, num>(
              //entry.key,
              DateFormat('MM').format(DateTime.parse(entry.key)),
              entry.value["EGP"] ?? 0,
            ),
          ),
    );

    return CurrencyTimeSeriesExchange(modelRates: rates);
  }
}
