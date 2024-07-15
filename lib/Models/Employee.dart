class Employee {
  String? id;
  String? name;
  String? role;
  String? gender;
  DateTime? dateOfBirth;

  // Constructor
  Employee({
    this.id,
    this.name,
    this.role,
    this.gender,
    this.dateOfBirth,
  });

  // Convert an object into a map format
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'gender': gender,
      'dateOfBirth': dateOfBirth?.toString(),
    };
  }

  // Create an object from a map
  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'],
      name: map['name'],
      role: map['role'],
      gender: map['gender'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }
}
