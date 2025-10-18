import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isla_vigu/features/bedrooms/presentation/bloc/bed_rooms_categories/bed_rooms_categories_cubit.dart';
import 'package:isla_vigu/features/bedrooms/presentation/widgets/categories_widget.dart';
import 'package:isla_vigu/features/bedrooms/presentation/widgets/range_price_slider.dart';
import 'package:isla_vigu/service_locator.dart';
import 'package:isla_vigu/shared/widgets/custom_scroll_layout.dart';

class BedRoomsScreen extends StatefulWidget {
  const BedRoomsScreen({super.key});

  @override
  State<BedRoomsScreen> createState() => _BedRoomsScreenState();
}

class _BedRoomsScreenState extends State<BedRoomsScreen> {
  double a = 0.4;
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
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 12),
                CategoriesWidget(),
                SizedBox(height: 21),
                Row(
                  children: [
                    Text(
                      "Rango de precio",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffAFD5F2),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 7),
                        child: Center(
                          child: Text(
                            "\$20 - \$150",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                RangePriceSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
