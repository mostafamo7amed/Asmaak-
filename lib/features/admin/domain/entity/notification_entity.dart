class NotificationEntity {
  String? message;
  String? id;

  NotificationEntity({this.message, this.id});

  NotificationEntity.fromJson(Map<String, dynamic> json) {
    message = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() => {'title': message, 'id': id};
}
