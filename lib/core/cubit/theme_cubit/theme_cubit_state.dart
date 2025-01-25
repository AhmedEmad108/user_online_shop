part of 'theme_cubit_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeChangedState extends ThemeState {
  final String themeMode;
  ThemeChangedState({required this.themeMode});
}
