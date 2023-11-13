import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/futures/localization/data/repositories/lang_repository/i_lang_repository.dart';
import 'package:dartz/dartz.dart';

import 'i_update_lang_use_case.dart';

class UpdateLangUseCase implements IUpdateLangUseCase {
  ILangRepository langRepository;

  UpdateLangUseCase({required this.langRepository});
  @override
  Future<Either<Failure, bool>> call(String lang) {
    return langRepository.updateLang(lang);
  }
}
