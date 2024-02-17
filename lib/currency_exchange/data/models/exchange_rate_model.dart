

import '../../domain/entities/exchange_rate_entity.dart';

/// direct function to build [ExchangeRateModel] form the response
ExchangeRateModel exchangeModelFromJson(Map<String, dynamic> response)=>
    //ExchangeRateModel.fromJson(response);
    ExchangeRateModel.readyToUse();


///
/// ExchangeRateModel
/// * The response model from GetExchangeRateRequest
///
class ExchangeRateModel extends ExchangeRateEntity{
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
  }):super(
    date: modelDate,
    baseCurrency: base,
    rates: modelRates
  );

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

  factory ExchangeRateModel.readyToUse() {
    return ExchangeRateModel(
      success:  false,
      timestamp: 0,
      base: "EUR",
      modelDate: "44/44/44",
      modelRates: {"AED": 3.958657, "AFN": 78.676872, "ALL": 103.734828, "AMD": 437.466391, "ANG": 1.943239, "AOA": 896.16167, "ARS": 896.447258, "AUD": 1.653146, "AWG": 1.939968, "AZN": 1.836471, "BAM": 1.956354, "BBD": 2.176816, "BDT": 118.322928, "BGN": 1.956021, "BHD": 0.404684, "BIF": 3088.859953, "BMD": 1.07776, "BND": 1.451011, "BOB": 7.450834, "BRL": 5.353346, "BSD": 1.078105, "BTC": 0.000020733409, "BTN": 89.49534, "BWP": 14.759176, "BYN": 3.528298, "BYR": 21124.094587, "BZD": 2.173215, "CAD": 1.454216, "CDF": 2969.228991, "CHF": 0.949219, "CLF": 0.037942, "CLP": 1046.94021, "CNY": 7.673224, "COP": 4215.431629, "CRC": 556.811784, "CUC": 1.07776, "CUP": 28.560638,"EGP":33.22413, "CVE": 110.848033}
      ,
    );
  }
}