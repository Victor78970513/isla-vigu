import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:isla_vigu/features/authentication/domain/repositories/auth_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationCubit({
    required this.authRepository,
  }) : super(AuthenticationInitial());

  Future<void> loginWithEmailAndPassowrd({
    required String email,
    required String password,
  }) async {
    emit(AuthenticationLoading());

    final response = await authRepository.loginWithEmailAndPassword(
        email: email, password: password);

    response.fold(
      (failure) {
        emit(AuthenticationError());
      },
      (user) {
        emit(AuthenticationSuccess(user: user));
      },
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthenticationLoading());
    final response = await authRepository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    response.fold((failure) {
      emit(AuthenticationError());
    }, (user) {
      emit(AuthenticationSuccess(user: user));
    });
  }

  Future<void> checkCurrentUser() async {
    emit(AuthenticationLoading());
    await Future.delayed(Duration(seconds: 3));
    final response = await authRepository.checkCurrentUser();
    response.fold((failure) {
      emit(AuthenticationInitial());
    }, (user) {
      emit(AuthenticationSuccess(user: user));
    });
  }
}
