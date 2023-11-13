import 'package:cleran_architecture_demo/core/error/failures.dart';
import 'package:cleran_architecture_demo/core/utils/app_strings.dart';

class MapFailure {
  static String failureToString(Failure failure) {
    Map<Failure, String> mapFailure = {
      ServerFailure(): AppStrings.serverFailure.name,
      CacheFailure(): AppStrings.cacheFailure.name,
      ChangeLangFailure(): AppStrings.changeLangFailure.name,
    };
    return mapFailure[failure] ?? AppStrings.unexpectedFailure.name;
  }
}
