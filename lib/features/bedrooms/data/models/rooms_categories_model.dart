import 'package:cloud_firestore/cloud_firestore.dart';

class RoomsCategoriesModel {
  final String categoryName;
  final DateTime createdAt;

  RoomsCategoriesModel({
    required this.categoryName,
    required this.createdAt,
  });

  factory RoomsCategoriesModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return RoomsCategoriesModel(
      categoryName: json["name"],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }
}
