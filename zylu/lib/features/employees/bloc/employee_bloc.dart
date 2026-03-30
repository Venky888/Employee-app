import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zylu/features/employees/bloc/employee_events.dart';
import 'package:zylu/features/employees/bloc/employee_repository.dart';
import 'package:zylu/features/employees/bloc/employee_states.dart';

class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeStates> {
  final EmployeeRepository repository;

  EmployeeBloc({required this.repository}) : super(EmployeeInitial()) {
    on<FetchEmployees>(_onFetchEmployees);
  }

  Future<void> _onFetchEmployees(
    FetchEmployees event,
    Emitter<EmployeeStates> emit,
  ) async {
   
    try {
      final currentState = state;

     
      if (currentState is EmployeeLoaded) {
        emit(EmployeeLoaded(currentState.employees, isRefreshing: true));
      } else {
        emit(EmployeeLoading());
      }

      final employees = await repository.getEmployees();


      emit(EmployeeLoaded(employees));
    } catch (e) {
      emit(EmployeeError("Error: ${e.toString()}"));
    }
  }
}
