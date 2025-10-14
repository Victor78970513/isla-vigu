import 'package:dartz/dartz.dart';
import 'package:isla_vigu/core/error/failures.dart';
import 'package:isla_vigu/features/bedrooms/data/models/rooms_categories_model.dart';

abstract class BedRoomsRepository {
  Future<Either<Failures, List<RoomsCategoriesModel>>> getRoomsCategories();
}
