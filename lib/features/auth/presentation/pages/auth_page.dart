import 'package:flutter/material.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';
import 'package:isla_vigu/features/auth/presentation/widgets/auth_selection.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.skyBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "ISLA VIGU",
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Quedate, Relajate, Juega",
                style: TextStyle(
                  color: AppColors.skyBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 64),
              AuthSelection(),
            ],
          ),
        ),
      ),
    );
  }
}
