//Model of Employee
class Employee {
  String? name;
  String? role;
  String? gender;
  DateTime? dateOfBirth;
//constructor
  Employee({
    this.gender,
    this.dateOfBirth,
    this.name,
    this.role
  });
 // convert an object into a map  format
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'gender': gender,
      'dateOfBirth': dateOfBirth?.toString(),
    };
  }
//create a object from map
  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      name: map['name'],
      role: map['role'],
      gender: map['gender'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }
}
