import 'package:dartz/dartz.dart';

import '../../data/api/errors/currency_api_error_type.dart';


/// UseCase<Type,Params>
/// * [Type] is the return type
/// * [Params] is the params you should pass to function
abstract class CurrencyUseCase<Type, Params> {
  Future<Either<CurrencyApiErrorType, Type>> call(Params params);
}
