import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:talk/features/authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({
    @required String? id,
    @required String? email,
    @required String? displayName,
    @required String? lastName,
    @required String? photoUrl,
    @required String? userDeviceId,
    @required String? bio,
    @required String? imageBanner,
    @required List? favoriteTopics,
    @required List? followers,
    @required List? following,
    @required Timestamp? lastSeen,
  }) : super(
          id: id,
          email: email!,
          displayName: displayName!,
          lastName: lastName!,
          photoUrl: photoUrl!,
          userDeviceId: userDeviceId!,
          bio: bio!,
          imageBanner: imageBanner!,
          favoriteTopics: favoriteTopics!,
          followers: followers!,
          following: following!,
          lastSeen: lastSeen!,
        );

  factory UserModel.fromDocument(dynamic doc) {
    return UserModel(
      id: doc["id"],
      email: doc["email"],
      displayName: doc["displayName"],
      lastName: doc["lastName"],
      photoUrl: doc["photoUrl"],
      userDeviceId: doc["userDeviceId"],
      imageBanner: doc["imageBanner"],
      bio: doc["bio"],
      favoriteTopics: doc["favoriteTopics"],
      followers: doc["followers"],
      following: doc["following"],
      lastSeen: doc["lastSeen"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "displayName": displayName,
      "lastName": lastName,
      "photoUrl": photoUrl,
      "imageBanner": imageBanner,
      "userDeviceId": userDeviceId,
      "bio": bio,
      "favoriteTopics": favoriteTopics,
      "lastSeen": lastSeen,
      "followers": followers,
      "following": following,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"],
      email: map["email"],
      displayName: map["displayName"],
      lastName: map["lastName"],
      photoUrl: map["photoUrl"],
      imageBanner: map["imageBanner"],
      userDeviceId: map["userDeviceId"],
      bio: map["bio"],
      lastSeen: map["lastSeen"],
      favoriteTopics: map["favoriteTopics"],
      followers: map["followers"],
      following: map["following"],
    );
  }
}
