import 'package:bloc/bloc.dart';
import 'package:cleran_architecture_demo/core/local_storage/local_storage/i_local_storage.dart';
import 'package:cleran_architecture_demo/config/themes/app_themes_enum.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ILocalStorage localStorage;
  ThemeCubit({required this.localStorage}) : super(ThemeInitialState());
  late MyThemeData currentThemeData;
  void updateTheme(MyThemeData newThemeData) async {
    currentThemeData = newThemeData;
    int themeDataIndex = _getThemeIndex(newThemeData);
    await localStorage.write(StorageKeys.themeDataIndex, themeDataIndex);

    emit(ThemeUpdatedState(themeData: currentThemeData.themeData));
  }

  // void updateTheme(int themeDataIndex) async {
  //   currentThemeDataIndex = themeDataIndex;
  //   var  = AppThemes.myThemes.elementAt(themeDataIndex);
  //   await localStorage.write(StorageKeys.themeDataIndex, currentThemeDataIndex);

  //   emit(ThemeUpdatedState(themeData: themeData));
  // }

  void getSavedThemeData() {
    int themeDataIndex = localStorage.read<int>(StorageKeys.themeDataIndex) ?? -1;

    if (themeDataIndex == -1) {
      //TODO make it dynamicly with device theme
      themeDataIndex = 0;
    }
    currentThemeData = AppThemes.myThemes.elementAt(themeDataIndex);
    emit(ThemeUpdatedState(themeData: currentThemeData.themeData));
  }

  int _getThemeIndex(MyThemeData themeData) {
    return AppThemes.myThemes.indexWhere((element) => element == themeData);
  }
}
