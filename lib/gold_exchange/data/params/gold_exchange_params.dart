import '../../constants/enums/metal_type_enum.dart';

class GoldExchangeParams {
  /// to be initialized form MetalType
  late final String metalCode;

  final String currencyCode;

  late List<String> _pathParameters;

  GoldExchangeParams({
    required MetalType metalType,
    required this.currencyCode,
  }) {
    /// init medal code
    metalCode = metalType.code;

    /// init the url path parameters
    _pathParameters = [metalCode, currencyCode];
  }

  // build the string separated by coma from the list
  String get pathParameters => _pathParameters.join('/');
}
