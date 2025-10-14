import 'package:flutter/material.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';

class CustomScrollLayout extends StatelessWidget {
  final Widget child;
  const CustomScrollLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Cuartos Disponibles",
                  style: TextStyle(
                    color: AppColors.darkColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "ISLA VIGU",
                  style: TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
        ),
        SliverToBoxAdapter(
          child: child,
        )
      ],
    );
  }
}
