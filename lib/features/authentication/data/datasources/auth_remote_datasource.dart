import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isla_vigu/core/error/exceptions.dart';

class AuthRemoteDatasource {
  final Dio dio;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthRemoteDatasource({required this.dio});

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user!;
    } catch (e) {
      print(e.toString());
      throw LoginException();
    }
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await users.add({
        "displayName": userCredential.user?.displayName,
        "email": userCredential.user?.email,
        "uid": userCredential.user?.uid,
      });
      await Future.delayed((Duration(seconds: 2)));
      return userCredential.user!;
    } catch (e) {
      print(e.toString());
      throw CreateUserException();
    }
  }

  Future<User> checkCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return user;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
