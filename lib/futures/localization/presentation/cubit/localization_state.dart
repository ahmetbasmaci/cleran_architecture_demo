part of 'localization_cubit.dart';

abstract class LocalizationState extends Equatable {
  // final String localeCode;
  // const LocalizationState(this.localeCode);

  @override
  List<Object> get props => [];
}

class LocalizationInitial extends LocalizationState {
  LocalizationInitial();
}

class LocalizationSuccesfulyUpdated extends LocalizationState {
  final String localeCode;

  LocalizationSuccesfulyUpdated({required this.localeCode}) : super();
}

class LocalizationFailedToUpdate extends LocalizationState {
  final String message;

  LocalizationFailedToUpdate({required this.message}) : super();
}
