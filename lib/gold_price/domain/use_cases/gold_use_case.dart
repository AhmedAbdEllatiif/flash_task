import 'package:dartz/dartz.dart';
import 'package:flash_task/gold_price/data/api/errors/gold_api_error.dart';


/// UseCase<Type,Params>
/// * [Type] is the return type
/// * [Params] is the params you should pass to function
abstract class GoldUseCase<Type, Params> {
  Future<Either<GoldApiError, Type>> call(Params params);
}
