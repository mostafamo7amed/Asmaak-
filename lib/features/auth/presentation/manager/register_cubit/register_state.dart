part of 'register_cubit.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {
  final User user;
  RegisterSuccess(this.user);
}
final class RegisterError extends RegisterState {}

final class RegisterCreateUserLoading extends RegisterState {}
final class RegisterCreateUserSuccess extends RegisterState {}
final class RegisterCreateUserError extends RegisterState {}

final class UpdateLevelAndCoinsLoadingState extends RegisterState {}
final class UpdateLevelAndCoinsSuccessState extends RegisterState {}
final class UpdateLevelAndCoinsErrorState extends RegisterState {}




