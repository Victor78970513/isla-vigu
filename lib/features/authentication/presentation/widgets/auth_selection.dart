import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';
import 'package:isla_vigu/features/authentication/presentation/bloc/auth_selection/auth_selection_cubit.dart';

class AuthSelection extends StatelessWidget {
  const AuthSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 6,
              color: Colors.black.withValues(alpha: 0.10),
            ),
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 15,
              color: Colors.black.withValues(alpha: 0.10),
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AuthSelectionItem(
                text: "Iniciar Sesion",
                authSelectionEnum: AuthSelectionEnum.loginSelection,
              ),
            ),
            Expanded(
              flex: 1,
              child: AuthSelectionItem(
                text: "Crear Cuenta",
                authSelectionEnum: AuthSelectionEnum.signUpSelection,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthSelectionItem extends StatelessWidget {
  final String text;
  final AuthSelectionEnum authSelectionEnum;
  const AuthSelectionItem({
    super.key,
    required this.text,
    required this.authSelectionEnum,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSelectionCubit, AuthSelectionEnum>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<AuthSelectionCubit>()
                .changeAuthSelection(authSelectionEnum);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: authSelectionEnum == state
                    ? AppColors.skyBlue
                    : AppColors.white,
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: authSelectionEnum == state
                        ? AppColors.white
                        : Color(0xff4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
