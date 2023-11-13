import 'package:cleran_architecture_demo/config/locale/app_local.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';
import 'package:cleran_architecture_demo/futures/home_page/home_page.dart';
import 'package:cleran_architecture_demo/futures/localization/presentation/cubit/localization_cubit.dart';
import 'package:cleran_architecture_demo/futures/random_quote/presentation/cubit/cubit/random_quote_cubit.dart';
import 'package:cleran_architecture_demo/futures/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleran_architecture_demo/injection_container.dart' as di;

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
        BlocProvider(
          create: (context) => di.sl<ThemeCubit>()..getSavedThemeData(),
        )
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
          return BlocBuilder<ThemeCubit,ThemeState>(
            builder: (context, state) {
              if (state is ThemeUpdatedState) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  locale: Locale(context.read<LocalizationCubit>().currentLangCode),
                  supportedLocales: AppLocale.supportedLocales,
                  //  localeResolutionCallback: AppLocale.localeResolutionCallback,
                  localizationsDelegates: AppLocale.localizationsDelegates,
                  title: AppStrings.appName.name,
                  theme: state.themeData,
                  home: const HomePage(),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}
