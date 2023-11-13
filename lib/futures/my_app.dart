import 'package:cleran_architecture_demo/config/locale/app_local.dart';
import 'package:cleran_architecture_demo/config/themes/app_theme.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:cleran_architecture_demo/futures/home_page/home_page.dart';
import 'package:cleran_architecture_demo/futures/localization/presentation/cubit/localization_cubit.dart';
import 'package:cleran_architecture_demo/futures/random_quote/presentation/cubit/cubit/random_quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleran_architecture_demo/injection_container.dart' as di;
import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//aspodasdşasilkdş
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<RandomQuoteCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<LocalizationCubit>()..getSavedLang(),
        ),
      ],
      child: BlocConsumer<LocalizationCubit, LocalizationState>(
        listener: (context2, state) {
          if (state is LocalizationSuccesfulyUpdated) {
            // Fluttertoast.showToast(msg: context.tr("LanguageChangedTo"));
          } else if (state is LocalizationFailedToUpdate) {
            //Fluttertoast.showToast(msg: "Field to change Language changed to ");
          }
        },
        // buildWhen: (previous, current) => previous == current,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale(context.read<LocalizationCubit>().currentLangCode),
            supportedLocales: AppLocale.supportedLocales,
            //  localeResolutionCallback: AppLocale.localeResolutionCallback,
            localizationsDelegates: AppLocale.localizationsDelegates,
            title: AppStrings.appName.name,
            theme: AppTheme.getAppTheme(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
