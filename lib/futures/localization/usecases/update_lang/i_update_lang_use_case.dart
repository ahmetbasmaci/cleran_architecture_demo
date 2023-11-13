import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IUpdateLangUseCase {
  Future<Either<Failure, bool>> call(String lang);
}
