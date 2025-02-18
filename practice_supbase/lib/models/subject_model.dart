class SubjectModel {
  final String? id;
  final String classId;
  final String subjectName;

  SubjectModel({
    this.id,
    required this.classId,
    required this.subjectName,
  });

  Map<String, dynamic> toMap() {
    return {
      'class_id': classId,
      'subject_name': subjectName,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'] ?? '',
      classId: map['class_id'] ?? '',
      subjectName: map['subject_name'] ?? '',
    );
  }
}
