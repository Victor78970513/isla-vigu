import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';
import 'package:isla_vigu/features/auth/presentation/bloc/auth_selection/auth_selection_cubit.dart';
import 'package:isla_vigu/features/auth/presentation/pages/login_page.dart';
import 'package:isla_vigu/features/auth/presentation/pages/sign_up_page.dart';
import 'package:isla_vigu/features/auth/presentation/widgets/auth_selection.dart';
import 'package:isla_vigu/service_locator.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<AuthSelectionCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
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
                SizedBox(height: 24),
                AuthSelection(),
                SizedBox(height: 20),
                BlocBuilder<AuthSelectionCubit, AuthSelectionEnum>(
                    builder: (context, state) {
                  switch (state) {
                    case AuthSelectionEnum.loginSelection:
                      return LoginPage();
                    case AuthSelectionEnum.signUpSelection:
                      return SignUpPage();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
