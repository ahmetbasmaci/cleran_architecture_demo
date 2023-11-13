import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ILangRepository {
  Either<Failure, String> getSavedLang();
  Future<Either<Failure, bool>> updateLang(String lang);
}
