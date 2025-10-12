import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isla_vigu/core/error/exceptions.dart';

class AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasource({required this.dio});

  Future<UserCredential> login(
      {required String email, required String password}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } catch (e) {
      print(e.toString());
      throw LoginException();
    }
  }
}
