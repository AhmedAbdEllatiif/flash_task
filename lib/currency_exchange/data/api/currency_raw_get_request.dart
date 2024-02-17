import 'package:http/http.dart' as http;


/// RawGetRequest<Model>
/// * [Params] the params to be send with the get request
abstract class CurrencyRawGetRequest<Params> {
  Future<http.Response> call(Params params);
}
