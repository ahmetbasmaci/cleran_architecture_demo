import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/futures/localization/data/repositories/lang_repository/i_lang_repository.dart';
import 'package:dartz/dartz.dart';
import 'i_get_saved_lang_use_case.dart';

class GetSavedLangUseCase implements IGetSavedLangUseCase {
  ILangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});
  @override
  Either<Failure, String> call() {
    return langRepository.getSavedLang();
  }
}
