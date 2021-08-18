import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? email;
  final String? displayName;
  final String? lastName;
  final String? photoUrl;
  final String? userDeviceId;
  final String? bio;
  final String? imageBanner;
  final List? favoriteTopics;
  final List? followers;
  final List? following;
  final Timestamp? lastSeen;

  UserEntity({
    @required this.id,
    @required this.email,
    @required this.displayName,
    @required this.lastName,
    @required this.photoUrl,
    @required this.userDeviceId,
    @required this.bio,
    @required this.imageBanner,
    @required this.favoriteTopics,
    @required this.followers,
    @required this.following,
    @required this.lastSeen,
  });

  @override
  List<Object> get props => [
        id!,
        email!,
        displayName!,
        lastName!,
        photoUrl!,
        userDeviceId!,
        bio!,
        imageBanner!,
        favoriteTopics!,
        followers!,
        following!,
        lastSeen!
      ];
}
