import 'package:cleran_architecture_demo/config/locale/app_local.dart';
import 'package:cleran_architecture_demo/config/themes/app_themes_enum.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:cleran_architecture_demo/futures/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThemeDropDown extends StatelessWidget {
  const ThemeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.tr(AppStrings.theme.name)),
      trailing: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return DropdownButton<MyThemeData>(
            value: context.read<ThemeCubit>().currentThemeData,
            onChanged: (MyThemeData? themeDataIndex) async {
              if (themeDataIndex != null) {
                context.read<ThemeCubit>().updateTheme(themeDataIndex);

                Fluttertoast.showToast(msg: context.tr("ThemeChanged"));
              }
            },
            items: AppThemes.myThemes.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e.name),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
