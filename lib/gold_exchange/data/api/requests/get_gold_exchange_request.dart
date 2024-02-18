import 'package:flash_task/gold_exchange/data/params/gold_exchange_params.dart';
import 'package:http/http.dart' as http;

import '../gold_api_client.dart';
import '../gold_raw_get_request.dart';



///
/// GetGoldExchangeRequest
///
///
/// Example:
/// * Example: https://www.goldapi.io/api/XAU/EGP
/// * https://www.goldapi.io/api/{pathParameters}
///
class GetGoldExchangeRequest extends GoldRawGetRequest<GoldExchangeParams> {
  @override
  Future<http.Response> call(GoldExchangeParams params) async {
    var response = await initGetGoldExchangeRequest(
      pathParameters: params.pathParameters,
    );
    return response;
  }
}
