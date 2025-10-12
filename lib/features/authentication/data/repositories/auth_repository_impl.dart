import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isla_vigu/core/error/failures.dart';
import 'package:isla_vigu/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:isla_vigu/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<Either<Failures, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDatasource.signInWithEmailAndPassword(
          email: email, password: password);
      return right(user);
    } catch (e) {
      return left(
        LoginFailure(),
      );
    }
  }

  @override
  Future<Either<Failures, User>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDatasource.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(user);
    } catch (e) {
      return left(
        LoginFailure(),
      );
    }
  }

  @override
  Future<Either<Failures, User>> checkCurrentUser() async {
    try {
      final user = await authRemoteDatasource.checkCurrentUser();
      return right(user);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
