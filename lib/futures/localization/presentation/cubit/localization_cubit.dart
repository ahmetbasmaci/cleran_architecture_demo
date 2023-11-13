import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:cleran_architecture_demo/core/utils/map_failure.dart';
import 'package:cleran_architecture_demo/futures/localization/usecases/get_saved_lang/i_get_saved_lang_use_case.dart';
import 'package:cleran_architecture_demo/futures/localization/usecases/update_lang/i_update_lang_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  IGetSavedLangUseCase getSavedLangUseCase;
  IUpdateLangUseCase updateLangUseCase;
  LocalizationCubit({required this.getSavedLangUseCase, required this.updateLangUseCase})
      : super(LocalizationInitial());

  String currentLangCode = AppStrings.englishCode.name;
  void getSavedLang() {
    print("--------------------------- getSavedLang ---------------------------");
    Either<Failure, String> savedLang = getSavedLangUseCase.call();
    savedLang.fold(
      (left) => emit(LocalizationFailedToUpdate(message: MapFailure.failureToString(left))),
      (right) {
        currentLangCode = right;
        emit(LocalizationSuccesfulyUpdated(localeCode: right));
      },
    );
  }

  void updateLang(String lang) async {
    print("--------------------------- updateLang ---------------------------");
    Either<Failure, bool> updateLang = await updateLangUseCase.call(lang);
    updateLang.fold(
      (left) => emit(LocalizationFailedToUpdate(message: MapFailure.failureToString(left))),
      (right) {
        currentLangCode = lang;
        emit(LocalizationInitial());
        emit(LocalizationSuccesfulyUpdated(localeCode: lang));
      },
    );
  }

  void toggleLocale() {
    if (currentLangCode == AppStrings.englishCode.name) {
      updateLang(AppStrings.arabicCode.name);
    } else {
      updateLang(AppStrings.englishCode.name);
    }
  }
}
