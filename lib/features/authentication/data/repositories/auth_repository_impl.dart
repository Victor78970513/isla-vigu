import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isla_vigu/core/error/failures.dart';
import 'package:isla_vigu/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:isla_vigu/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<Either<Failures, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user =
          await authRemoteDatasource.login(email: email, password: password);
      return right(user);
    } catch (e) {
      return left(
        LoginFailure(),
      );
    }
  }
}
