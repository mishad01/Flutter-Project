class Employee {
  final int id;
  final String name;
  final int age;
  final int salary;

  Employee({
    required this.id,
    required this.name,
    required this.age,
    required this.salary,
  });

  // Method to convert an Employee object to a JSON Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'salary': salary,
    };
  }

  // Factory constructor to create an Employee object from JSON
  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      salary: map['salary'],
    );
  }
}
