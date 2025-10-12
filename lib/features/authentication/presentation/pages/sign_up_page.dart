import 'package:flutter/material.dart';
import 'package:isla_vigu/features/authentication/presentation/widgets/auth_button.dart';
import 'package:isla_vigu/features/authentication/presentation/widgets/auth_input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          AuthInput(
            prefixIcon: Icons.person,
            title: "Nombre Completo",
            hintText: "Ingresa tu nombre completo",
          ),
          AuthInput(
            prefixIcon: Icons.message,
            title: "Correo Electronico",
            hintText: "Ingresa tu correo",
          ),
          AuthInput(
            prefixIcon: Icons.lock,
            title: "Contraseña",
            hintText: "Ingresa tu contraseña",
            showSuffixcIcon: true,
          ),
          AuthInput(
            prefixIcon: Icons.lock,
            title: "Confirmar Contraseña",
            hintText: "Confirma tu contraseña",
            showSuffixcIcon: true,
          ),
          SizedBox(height: 12),
          AuthButton(
            text: "Crear cuenta",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
