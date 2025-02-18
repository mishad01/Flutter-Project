class CategoriesModel {
  final String? id;
  final String name;

  CategoriesModel({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
