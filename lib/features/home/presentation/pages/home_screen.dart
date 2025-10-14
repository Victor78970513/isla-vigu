import 'package:flutter/material.dart';
import 'package:isla_vigu/features/bedrooms/presentation/pages/bed_rooms_screens.dart';
import 'package:isla_vigu/features/home/presentation/widgets/bouncing_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: [
          BedRoomsScreens(),
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.purple),
        ],
      ),
      bottomNavigationBar: BouncingNavBar(
        onTapChanged: (index) {
          setState(() => currentIndex = index);
        },
        backgroundColor: Colors.white,
        items: [
          Icon(Icons.bed, color: Colors.black),
          Icon(Icons.sports_volleyball, color: Colors.black),
          Icon(Icons.calendar_month, color: Colors.black),
          Icon(Icons.person, color: Colors.black),
        ],
      ),
    );
  }
}
