import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String arival;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.arival,
      required this.email});

  toJson() {
    return {"fullName": fullName, "Email": email, "arival": arival};
  }

  // static UserModel formJson(Map<String, dynamic> json) =>
  //   UserModel(fullName: json["fullName"], password: json["password"], email: json["Email"]);

  // MAP USER FETCHED FROM FIREBASE TO UserModel

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UserModel(
        id: document.id,
        fullName: data["fullName"],
        arival: data["arival"],
        email: data["Email"]);
  }
}
