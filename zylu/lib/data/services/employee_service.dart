

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zylu/features/employees/model/employee_model.dart';

class EmployeeService {
 
  Stream<List<Employee>> getEmployees() {
    return FirebaseFirestore.instance.collection('employees').snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return Employee.fromFireStore(doc.id, doc.data());
      }).toList();
    });
  }
}
