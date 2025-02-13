class UserEntity {
  final String? uid;
  final String? name;
  final String? gender;
  final String? email;
  final String? image;
  final String? dateOfBirth;
  final bool? receiveNotification;
  final String? fcmToken;

  UserEntity({
    this.uid,
    this.name,
    this.gender,
    this.email,
    this.image,
    this.dateOfBirth,
    this.receiveNotification,
    this.fcmToken,
  });

  toMap() => {
        'uid': uid,
        'name': name,
        'gender': gender,
        'email': email,
        'image': image,
        'dateOfBirth': dateOfBirth,
        'receiveNotification': receiveNotification,
        'fcmToken': fcmToken
      };

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
        uid: map['uid'],
        name: map['name'],
        gender: map['gender'],
        email: map['email'],
        image: map['image'],
        dateOfBirth: map['dateOfBirth'],
        receiveNotification: map['receiveNotification'],
        fcmToken: map['fcmToken'],
      );
}
