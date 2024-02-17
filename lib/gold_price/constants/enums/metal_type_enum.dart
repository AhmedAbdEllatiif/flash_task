
/// Metal types in readable way
enum MetalType { gold,silver }


///
///
/// convert the readable metal type to Metal Code
extension MetalCodeExtension on MetalType {
  String get code {
    switch (this) {
      case MetalType.gold:
        return 'XAU';
      case MetalType.silver:
        return 'XAG';
      default:
        return 'XAU';
    }
  }
}