import 'package:equatable/equatable.dart';

abstract class EmployeeEvents extends Equatable {
  const EmployeeEvents();

  @override
  List<Object?> get props => [];
}

class FetchEmployees extends EmployeeEvents {}
