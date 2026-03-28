import 'package:equatable/equatable.dart';
import 'package:zylu/features/employees/model/employee_model.dart';

abstract class EmployeeStates extends Equatable {
  const EmployeeStates();

  @override
  List<Object?> get props => [];
}

class EmployeeInitial extends EmployeeStates {}

class EmployeeLoading extends EmployeeStates {}

class EmployeeLoaded extends EmployeeStates {
  final List<Employee> employees;
   final bool isRefreshing;

  const EmployeeLoaded(this.employees, {this.isRefreshing = false});
   @override
  List<Object?> get props => [employees, isRefreshing];
}



class EmployeeError extends EmployeeStates {
  final String message;

  const EmployeeError(this.message);
}
