class CategoryEntity {
  final String  id;
  final String name;
  final String image;

  CategoryEntity({required this.id, required this.name, required this.image});

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'image': image};

  factory CategoryEntity.fromMap(Map<String, dynamic> map) => CategoryEntity(id: map['id'], name: map['name'], image: map['image']);
}