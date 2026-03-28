import 'package:zylu/features/employees/model/employee_model.dart';

class EmployeeUtils {
  static int calculateYears(DateTime joiningDate) {
    return DateTime.now().difference(joiningDate).inDays ~/ 365;
  }

  static bool isSenior(Employee emp) {
    return calculateYears(emp.joiningDate) >= 5 && emp.isActive;
  }

  static List<Employee> filterEmployees({
    required List<Employee> employees,
    required String query,
    required String filter,
  }) {
    return employees.where((emp) {
      final matchesSearch =
          emp.name.toLowerCase().contains(query) ||
          emp.email.toLowerCase().contains(query);

      final years = calculateYears(emp.joiningDate);

      switch (filter) {
        case "active":
          return matchesSearch && emp.isActive;
        case "inactive":
          return matchesSearch && !emp.isActive;
        case "5years":
          return matchesSearch && years > 5;
        case "2years":
          return matchesSearch && years > 2;
        default:
          return matchesSearch;
      }
    }).toList();
  }
}
