import 'package:http/http.dart' as http;

import 'gold_api_constants.dart';

///
/// Initialize the http client
///
http.Client initHttpClient() {
  return http.Client();
}

///
///
/// return a get response
/// * [pathParameters] >> pathParameters
/// * Example: https://www.goldapi.io/api/XAU/EGP
/// *  https://www.goldapi.io/api/{pathParameters}
///
Future<http.Response> initGetGoldExchangeRequest({
  required String pathParameters,
}) async {
  // build the uri
  // https://{baseUrl}/{apiEndPoint}/{pathParameters}
  final url = Uri.https(
    GoldApiBase.baseUrl,
    "${GoldEndPoints.apiEndPoint}$pathParameters",
  );

  // send the request
  final response = await http.get(
    url,
    headers: {
      "x-access-token": GoldApiBase.apiKey,
    },
  );

  // return the response
  return response;
}
