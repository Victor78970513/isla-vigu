import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isla_vigu/core/error/exceptions.dart';
import 'package:isla_vigu/features/bedrooms/data/models/rooms_categories_model.dart';

class BedRoomsRemoteDatasource {
  Future<List<RoomsCategoriesModel>> getRoomsCategories() async {
    List<RoomsCategoriesModel> categories = [];
    try {
      final response =
          await FirebaseFirestore.instance.collection("categories").get();
      for (final categorie in response.docs) {
        categories.add(RoomsCategoriesModel.fromJson(categorie));
      }
      return categories;
    } catch (e) {
      print("ERROR ${e.toString()}");
      throw RoomsCategoriesException();
    }
  }
}
