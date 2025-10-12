part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {
  final UserCredential userCredential;

  AuthenticationSuccess({required this.userCredential});
}

final class AuthenticationError extends AuthenticationState {}
