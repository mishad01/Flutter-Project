class ClassModel {
  final String? id;
  final String categoryId;
  final String name;

  ClassModel({
    this.id,
    required this.categoryId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'category_id': categoryId, // Corrected column name
      'name': name,
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      id: map['id'] ?? '',
      categoryId: map['categoryId'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
