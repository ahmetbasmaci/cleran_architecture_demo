import 'package:cleran_architecture_demo/core/local_storage/local_storage/i_local_storage.dart';
import 'package:cleran_architecture_demo/core/local_storage/local_storage/local_storage.dart';
import 'package:cleran_architecture_demo/core/network/network_info.dart';
import 'package:cleran_architecture_demo/futures/localization/data/datasources/lang_data_source/i_lang_data_source.dart';
import 'package:cleran_architecture_demo/futures/localization/data/datasources/lang_data_source/lang_data_source.dart';
import 'package:cleran_architecture_demo/futures/localization/data/repositories/lang_repository/i_lang_repository.dart';
import 'package:cleran_architecture_demo/futures/localization/data/repositories/lang_repository/lang_repository.dart';
import 'package:cleran_architecture_demo/futures/localization/presentation/cubit/localization_cubit.dart';
import 'package:cleran_architecture_demo/futures/localization/usecases/get_saved_lang/get_saved_lang_use_case.dart';
import 'package:cleran_architecture_demo/futures/localization/usecases/update_lang/update_lang_use_case.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/datasorces/random_quote_local_data_source.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/datasorces/random_quote_remote_data_source.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/repositories/quote_repository_empl.dart';
import 'package:cleran_architecture_demo/futures/random_quote/data/repositories/quote_repository.dart';
import 'package:cleran_architecture_demo/futures/random_quote/usecases/get_random_quote.dart';
import 'package:cleran_architecture_demo/futures/random_quote/presentation/cubit/cubit/random_quote_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  var sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ILocalStorage>(() => LocalStorage());

  await _initLocalizationQuoteFuture();
  await _initRandomQuoteFuture();
}

Future<void> _initLocalizationQuoteFuture() async {
  //! Features

  // Data sources
  sl.registerLazySingleton<ILangDataSource>(() => LangDataSource(localStorage: sl()));

  // Repository
  sl.registerLazySingleton<ILangRepository>(() => LangRepository(langDataSource: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton(() => UpdateLangUseCase(langRepository: sl()));

  // Bloc
  sl.registerFactory(() => LocalizationCubit(
        getSavedLangUseCase: GetSavedLangUseCase(langRepository: sl()),
        updateLangUseCase: UpdateLangUseCase(langRepository: sl()),
      ));
}

Future<void> _initRandomQuoteFuture() async {
  //! Features - Random Quote
  // Bloc
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetRandomQuote(repository: sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryEmpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  // Data sources
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(() => RandomQuoteRemoteDataSourceImpl());
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(() => RandomQuoteLocalDataSourceImpl(localStorage: sl()));
}
