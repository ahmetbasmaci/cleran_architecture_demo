import 'dart:io';

import 'package:cleran_architecture_demo/core/error/exceptions.dart';
import 'package:cleran_architecture_demo/core/local_storage/local_storage/i_local_storage.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'i_lang_data_source.dart';

class LangDataSource implements ILangDataSource {
  ILocalStorage localStorage;

  LangDataSource({required this.localStorage});
  @override
  String getSavedLang() {
    try {
      String langValue = localStorage.read<String>(AppStrings.localization.name) ?? getDefaultLang();
      return langValue;
    } catch (e) {
      throw ChangeLangException();
    }
  }

  @override
  Future<bool> updateLang(String lang) async {
    try {
      await localStorage.write(AppStrings.localization.name, lang);
      return true;
    } catch (e) {
      throw ChangeLangException();
    }
  }

  @override
  String getDefaultLang() {
    return Platform.localeName.split('_')[0];
  }
}
