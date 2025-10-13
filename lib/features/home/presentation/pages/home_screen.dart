import 'package:flutter/material.dart';
import 'package:isla_vigu/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Text("ANIA"),
          Text("ANIA2"),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
