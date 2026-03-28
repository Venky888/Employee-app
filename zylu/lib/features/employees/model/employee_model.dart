import 'package:cloud_firestore/cloud_firestore.dart';


class Employee  {
  final String id;
  final String name;
  final String email;
  final int totalExperience;
  final bool isActive;
  final DateTime joiningDate;
  final String employeeId;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.totalExperience,
    required this.isActive,
    required this.joiningDate,
    required this.employeeId,
  });
  
  factory Employee.fromFireStore(String documentId, Map<String, dynamic> data) {
    return Employee(
      id: documentId,
      name: data["name"] ?? "user",
      email: data["email"] ?? "user@zylu.com",
      totalExperience: data["totalExperience"] ?? 0,
      isActive: data["isActive"] ?? false,
      joiningDate: (data["joiningDate"] as Timestamp).toDate(),
      employeeId: data["employeeId"] ?? "zylu_id",
    );
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      totalExperience: json['experience'] ?? 0,
      isActive: json['is_active'] == 1,
      joiningDate: DateTime.parse(json['joining_date']),
      employeeId: json['employee_id'] ?? '',
    );
  }
}
