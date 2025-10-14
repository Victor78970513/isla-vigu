import 'package:dartz/dartz.dart';
import 'package:isla_vigu/core/error/failures.dart';
import 'package:isla_vigu/features/bedrooms/data/datasources/bed_rooms_remote_datasource.dart';
import 'package:isla_vigu/features/bedrooms/data/models/rooms_categories_model.dart';
import 'package:isla_vigu/features/bedrooms/domain/repositories/bed_rooms_repository.dart';

class BedRoomsRepositoryImpl implements BedRoomsRepository {
  final BedRoomsRemoteDatasource bedRoomsRemoteDatasource;

  BedRoomsRepositoryImpl({required this.bedRoomsRemoteDatasource});
  @override
  Future<Either<Failures, List<RoomsCategoriesModel>>>
      getRoomsCategories() async {
    try {
      final categories = await bedRoomsRemoteDatasource.getRoomsCategories();
      return right(categories);
    } catch (e) {
      return left(
        RoomsCategoriesFailure(),
      );
    }
  }
}
