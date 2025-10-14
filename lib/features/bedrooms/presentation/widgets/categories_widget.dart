import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';
import 'package:isla_vigu/features/bedrooms/presentation/bloc/bed_rooms_categories/bed_rooms_categories_cubit.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BedRoomsCategoriesCubit, BedRoomsCategoriesState>(
      builder: (context, state) {
        switch (state) {
          case BedRoomsCategoriesSuccess(categories: final categories):
            return Row(
              children: List.generate(categories.length, (index) {
                final categorie = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.skyBlue,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(width: 4),
                          Text(
                            categorie.categoryName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );

          default:
            return Container(
              child: Text("ANIA"),
            );
        }
      },
    );
  }
}
