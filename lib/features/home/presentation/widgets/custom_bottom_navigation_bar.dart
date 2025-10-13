import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';
import 'package:isla_vigu/features/home/presentation/bloc/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavigationBarItem(
            icon: Icons.king_bed,
            text: "Dormitorios",
            index: 0,
          ),
          BottomNavigationBarItem(
            icon: Icons.sports_volleyball_outlined,
            text: "Canchas",
            index: 1,
          ),
          BottomNavigationBarItem(
            icon: Icons.calendar_month_sharp,
            text: "Reservaciones",
            index: 2,
          ),
          BottomNavigationBarItem(
            icon: Icons.person,
            text: "Mi Perfil",
            index: 3,
          )
        ],
      ),
    );
  }
}

class BottomNavigationBarItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final int index;
  const BottomNavigationBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
  });

  @override
  State<BottomNavigationBarItem> createState() =>
      _BottomNavigationBarItemState();
}

class _BottomNavigationBarItemState extends State<BottomNavigationBarItem>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 50, end: 130).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    const double minWidthToShowText = 100.0;
    final double textOpacity = animation.value > minWidthToShowText ? 1.0 : 0.0;
    return BlocProvider(
      create: (context) => BottomNavigationBarCubit(),
      child: BlocBuilder<BottomNavigationBarCubit, int>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              if (widget.index == state) {
                controller.forward();
              }
              if (widget.index != state) {
                controller.reverse();
              }
            },
            child: Container(
              height: 50,
              width: animation.value,
              decoration: BoxDecoration(
                color: AppColors.skyBlue,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 12),
                  Icon(
                    widget.icon,
                    color: AppColors.white,
                    size: 25,
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Opacity(
                      opacity: textOpacity,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
