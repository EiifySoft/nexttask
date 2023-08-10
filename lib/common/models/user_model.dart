import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? photoUrl;
  final String? password;
  final bool? isAdmin;
  final bool? isEngineer;
  final bool? isOnline;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final Timestamp? lastSeen;
  final String? provider;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.photoUrl,
    this.password,
    this.isAdmin,
    this.isEngineer,
    this.isOnline,
    this.createdAt,
    this.updatedAt,
    this.lastSeen,
    this.provider,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      id: snapshot["id"],
      username: snapshot["username"],
      email: snapshot["email"],
      phone: snapshot["phone"],
      photoUrl: snapshot["photoUrl"],
      password: snapshot["password"],
      isAdmin: snapshot["isAdmin"],
      isEngineer: snapshot["isEngineer"],
      isOnline: snapshot["isOnline"],
      createdAt: snapshot["createdAt"],
      updatedAt: snapshot["updatedAt"],
      lastSeen: snapshot["lastSeen"],
      provider: snapshot["provider"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "photoUrl": photoUrl,
        "password": password,
        "isAdmin": isAdmin,
        "isEngineer": isEngineer,
        "isOnline": isOnline,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "lastSeen": lastSeen,
        "provider": provider,
      };
}
