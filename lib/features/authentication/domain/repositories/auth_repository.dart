import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isla_vigu/core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, User>> checkCurrentUser();

  Future<Either<Failures, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failures, User>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
