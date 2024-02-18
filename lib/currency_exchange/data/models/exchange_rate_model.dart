import '../../domain/entities/exchange_rate_entity.dart';

/// direct function to build [ExchangeRateModel] form the response
ExchangeRateModel exchangeModelFromJson(Map<String, dynamic> response) =>
    ExchangeRateModel.fromJson(response);

///
/// ExchangeRateModel
/// * The response model from GetExchangeRateRequest
///
class ExchangeRateModel extends ExchangeRateEntity {
  final bool success;
  final int timestamp;
  final String base;
  final String modelDate;
  final Map<String, num> modelRates;

  ExchangeRateModel({
    required this.success,
    required this.timestamp,
    required this.base,
    required this.modelDate,
    required this.modelRates,
  }) : super(date: modelDate, baseCurrency: base, rates: modelRates);

  // Factory method to create an instance of ExchangeRateModel from JSON
  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    return ExchangeRateModel(
      success: json['success'] ?? false,
      timestamp: json['timestamp'] ?? 0,
      base: json['base'] ?? "",
      modelDate: json['date'] ?? "",
      modelRates: Map<String, num>.from(json['rates'] ?? {}),
    );
  }


  // empty model
  factory ExchangeRateModel.empty() {
    return ExchangeRateModel(
      success: false,
      timestamp: 0,
      base: "",
      modelDate: "",
      modelRates: const {},
    );
  }
}
