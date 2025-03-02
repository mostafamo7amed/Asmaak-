class AdminEntity {
  final String uid;
  final String email;
  final String? name;
  AdminEntity(this.name, {required this.email, required this.uid});

  factory AdminEntity.fromMap(Map<String, dynamic> map) =>
      AdminEntity(map['name'], email: map['email'], uid: map['uid']);

  Map<String, dynamic> toMap() => {'name': name, 'email': email, 'uid': uid};
}
