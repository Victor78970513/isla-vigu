import 'package:flutter/material.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/authentication/authentication_cubit.dart';
import 'package:isla_vigu/features/authentication/presentation/widgets/auth_button.dart';
import 'package:isla_vigu/features/authentication/presentation/widgets/auth_input.dart';
import 'package:isla_vigu/service_locator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authenticationCubit = getIt<AuthenticationCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          AuthInput(
            controller: nameController,
            prefixIcon: Icons.person,
            title: "Nombre Completo",
            hintText: "Ingresa tu nombre completo",
          ),
          AuthInput(
            controller: emailController,
            prefixIcon: Icons.message,
            title: "Correo Electronico",
            hintText: "Ingresa tu correo",
          ),
          AuthInput(
            controller: passwordController,
            prefixIcon: Icons.lock,
            title: "Contraseña",
            hintText: "Ingresa tu contraseña",
            showSuffixcIcon: true,
          ),
          AuthInput(
            controller: confirmPasswordController,
            prefixIcon: Icons.lock,
            title: "Confirmar Contraseña",
            hintText: "Confirma tu contraseña",
            showSuffixcIcon: true,
          ),
          SizedBox(height: 12),
          AuthButton(
            text: "Crear cuenta",
            onTap: () {
              authenticationCubit.createUserWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
              );
            },
          )
        ],
      ),
    );
  }
}
