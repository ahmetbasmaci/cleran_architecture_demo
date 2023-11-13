import 'package:cleran_architecture_demo/core/error/exceptions.dart';
import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/futures/localization/data/datasources/lang_data_source/i_lang_data_source.dart';
import 'package:dartz/dartz.dart';
import 'i_lang_repository.dart';

class LangRepository implements ILangRepository {
  ILangDataSource langDataSource;

  LangRepository({required this.langDataSource});
  @override
  Either<Failure, String> getSavedLang() {
    try {
      String langValue = langDataSource.getSavedLang();
      return Right(langValue);
    } on ChangeLangException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateLang(String lang) async {
    try {
      bool langValue = await langDataSource.updateLang(lang);
      return Right(langValue);
    } on ChangeLangException {
      return Left(CacheFailure());
    }
  }
}
