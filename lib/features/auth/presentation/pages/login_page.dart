import 'package:flutter/material.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';
import 'package:isla_vigu/features/auth/presentation/widgets/auth_button.dart';
import 'package:isla_vigu/features/auth/presentation/widgets/auth_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AuthInput(
            title: "Correo Electronico",
            prefixIcon: Icons.message,
            hintText: "Ingresa tu Correo",
          ),
          AuthInput(
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
          ),
        ],
      ),
    );
  }
}
