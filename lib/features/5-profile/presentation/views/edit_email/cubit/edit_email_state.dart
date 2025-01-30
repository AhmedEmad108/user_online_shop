part of 'edit_email_cubit.dart';

sealed class EditEmailState extends Equatable {
  const EditEmailState();

  @override
  List<Object> get props => [];
}

final class EditEmailInitial extends EditEmailState {}

final class EditEmailLoading extends EditEmailState {}

final class EditEmailSuccess extends EditEmailState {}

final class EditEmailFailed extends EditEmailState {
  final String error;

  const EditEmailFailed({required this.error});

  @override
  List<Object> get props => [error];
}
