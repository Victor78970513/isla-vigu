import 'package:flutter/material.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/authentication/authentication_cubit.dart';
import 'package:isla_vigu/features/authentication/presentation/widgets/auth_button.dart';
import 'package:isla_vigu/features/authentication/presentation/widgets/auth_input.dart';
import 'package:isla_vigu/service_locator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authenticationCubit = getIt<AuthenticationCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AuthInput(
            controller: emailController,
            title: "Correo Electronico",
            prefixIcon: Icons.message,
            hintText: "Ingresa tu Correo",
          ),
          AuthInput(
            controller: passwordController,
            title: "Contraseña",
            hintText: "Ingresa tu contraseña",
            prefixIcon: Icons.lock,
            showSuffixcIcon: true,
          ),
          SizedBox(height: 14),
          Text(
            "¿Olvidaste tu contraseña?",
            style: TextStyle(
              color: AppColors.skyBlue,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 24),
          AuthButton(
            text: "Iniciar Sesión",
            onTap: () {
              authenticationCubit.loginWithEmailAndPassowrd(
                email: emailController.text,
                password: passwordController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
