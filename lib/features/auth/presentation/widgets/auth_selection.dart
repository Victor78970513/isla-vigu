import 'package:flutter/material.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';

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
          color: Colors.red,
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
              child: AuthSelectionItem(text: "Sign In"),
            ),
            Expanded(
              flex: 1,
              child: AuthSelectionItem(
                text: "Create Account",
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
  const AuthSelectionItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.skyBlue,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
