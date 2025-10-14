import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isla_vigu/features/bedrooms/presentation/bloc/bed_rooms_categories/bed_rooms_categories_cubit.dart';
import 'package:isla_vigu/features/bedrooms/presentation/widgets/categories_widget.dart';
import 'package:isla_vigu/service_locator.dart';
import 'package:isla_vigu/shared/widgets/custom_scroll_layout.dart';

class BedRoomsScreens extends StatelessWidget {
  const BedRoomsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<BedRoomsCategoriesCubit>()..getRoomsCategories(),
      child: Scaffold(
        body: CustomScrollLayout(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Categorias",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 12),
                CategoriesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
