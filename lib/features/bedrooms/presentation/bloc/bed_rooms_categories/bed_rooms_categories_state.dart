part of 'bed_rooms_categories_cubit.dart';

@immutable
sealed class BedRoomsCategoriesState {}

final class BedRoomsCategoriesInitial extends BedRoomsCategoriesState {}

final class BedRooomsCategoriesLoading extends BedRoomsCategoriesState {}

final class BedRoomsCategoriesSuccess extends BedRoomsCategoriesState {
  final List<RoomsCategoriesModel> categories;

  BedRoomsCategoriesSuccess({required this.categories});
}

final class BedRoomsCategoriesError extends BedRoomsCategoriesState {}
