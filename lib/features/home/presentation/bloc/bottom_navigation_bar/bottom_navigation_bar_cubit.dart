import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_bar_state.dart';

// class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
//   BottomNavigationBarCubit() : super(BottomNavigationBarInitial());
// }

class BottomNavigationBarCubit extends Cubit<int> {
  BottomNavigationBarCubit() : super(0);

  void changeCurrentPage(int value) {
    emit(value);
  }
}
