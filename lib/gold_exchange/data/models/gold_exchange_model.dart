import 'package:flash_task/gold_exchange/domain/entities/gold_exchange_entity.dart';

/// direct function to build [GoldExchangeModel] form the response
GoldExchangeModel exchangeGoldModelFromJson(Map<String, dynamic> response) =>
    GoldExchangeModel.fromJson(response);

///
///
///
/// GoldExchangeModel
///
class GoldExchangeModel extends GoldExchangeEntity {
  final int timestampModel;
  final Map<String, num> modelPrices;

  const GoldExchangeModel({
    required this.timestampModel,
    required this.modelPrices,
  }) : super(
          timestamp: timestampModel,
          prices: modelPrices,
        );

  factory GoldExchangeModel.fromJson(Map<String, dynamic> json) {
    /// build a map of all prices from the json
    /// Original key string >> price_gram_24k
    /// will converted to 24
    Map<String, num> pricesMap = Map.fromEntries(
      json.entries.where((entry) => entry.key.startsWith("price_gram_")).map(
            (entry) => MapEntry(
              entry.key.endsWith("k")
                  ? entry.key
                      .substring(entry.key.length - 3, entry.key.length - 1)
                  : entry.key,
              entry.value,
            ),
          ),
    );

    return GoldExchangeModel(
      timestampModel: json["timestamp"] ?? -1,
      modelPrices: pricesMap,
    );
  }
}
