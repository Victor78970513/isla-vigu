import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isla_vigu/features/bedrooms/data/models/rooms_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:isla_vigu/features/bedrooms/domain/repositories/bed_rooms_repository.dart';

part 'bed_rooms_categories_state.dart';

class BedRoomsCategoriesCubit extends Cubit<BedRoomsCategoriesState> {
  final BedRoomsRepository bedRoomsRepository;
  BedRoomsCategoriesCubit({
    required this.bedRoomsRepository,
  }) : super(BedRoomsCategoriesInitial());

  RoomsCategoriesModel? currentCategorySelected;
  List<RoomsCategoriesModel>? bedRoomsCategories;

  Future<void> getRoomsCategories() async {
    emit(BedRooomsCategoriesLoading());
    final response = await bedRoomsRepository.getRoomsCategories();
    response.fold(
      (failure) {
        BedRoomsCategoriesError();
      },
      (categories) {
        currentCategorySelected = categories.first;
        bedRoomsCategories = categories;
        emit(
          BedRoomsCategoriesSuccess(categories: categories),
        );
      },
    );
  }
}
