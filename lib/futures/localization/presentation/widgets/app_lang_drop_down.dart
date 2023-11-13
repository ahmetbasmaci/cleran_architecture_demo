import 'package:cleran_architecture_demo/config/locale/app_local.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:cleran_architecture_demo/futures/localization/presentation/cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppLangDropDown extends StatelessWidget {
  const AppLangDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.tr(AppStrings.languages.name)),
      trailing: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return DropdownButton(
            value: context.read<LocalizationCubit>().currentLangCode,
            onChanged: (String? lang) async {
              if (lang != null) {
                context.read<LocalizationCubit>().updateLang(lang);
                Future.delayed(Duration(milliseconds: 100)).then((value) {
                  Fluttertoast.showToast(msg: context.tr("LanguageChangedTo"));
                });
              }
            },
            items: List.generate(
              AppLocale.supportedLocales.length,
              (index) {
                return DropdownMenuItem(
                  value: AppLocale.supportedLocales.elementAt(index).languageCode,
                  child: Text(AppLocale.supportedLocales.elementAt(index).languageCode),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
