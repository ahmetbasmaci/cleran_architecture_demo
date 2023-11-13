import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IGetSavedLangUseCase {
  Either<Failure, String> call();
}
