import 'package:http/http.dart' as http;

import 'currency_api_constants.dart';

///
/// Initialize the http client
///
http.Client initHttpClient() {
  return http.Client();
}


///
///
/// return a get response
/// * [endPoint] >> the endpoint of the base
/// * [queryParams] >> the params to be sent with the request, empty by default
///
Future<http.Response> initGetRequest({
  required String endPoint,
  Map<String, String> queryParams = const {"": ""},
}) async {

  // build the uri
  final url = Uri.http(
    CurrencyApiBase.baseUrl,
    endPoint,
    queryParams,
  );

  // send the request
  final response = await http.get(url);


  // return the response
  return response;
}