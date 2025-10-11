import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthSelectionEnum { loginSelection, signUpSelection }

class AuthSelectionCubit extends Cubit<AuthSelectionEnum> {
  AuthSelectionCubit() : super(AuthSelectionEnum.loginSelection);

  void changeAuthSelection(AuthSelectionEnum value) {
    emit(value);
  }
}
