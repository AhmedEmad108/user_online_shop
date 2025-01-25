part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {}

class ChangePasswordFailure extends ChangePasswordState {
  final String error;

  ChangePasswordFailure({required this.error});
}
