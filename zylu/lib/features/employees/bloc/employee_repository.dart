import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zylu/features/employees/model/employee_model.dart';

class EmployeeRepository {
  Future<List<Employee>> getEmployees() async {
    final response = await http.get(
      Uri.parse('http://192.168.1.100:9000/api/employees'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data.map((e) => Employee.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load employees");
    }
  }
}
