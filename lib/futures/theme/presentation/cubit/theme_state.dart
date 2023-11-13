part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitialState extends ThemeState {}

final class ThemeUpdatedState extends ThemeState {
  final ThemeData themeData;

  ThemeUpdatedState({required this.themeData});

  @override
  List<Object> get props => [themeData];
}
