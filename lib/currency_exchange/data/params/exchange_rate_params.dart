
///
/// CompareRateParams
/// * [baseCurrency] the base currency to compare with
/// * [_rateCurrencies] is a list of currencies to be compared with the [baseCurrency]
///
class ExchangeRateParams {
  final String baseCurrency;
  late List<String> _rateCurrencies;

  ExchangeRateParams({
    required this.baseCurrency,
    required List<String> rateCurrencies,
  }){
    _rateCurrencies = rateCurrencies;
  }

  // build the string separated by coma from the list
  String get rateCurrencies => _rateCurrencies.join(', ');
}
