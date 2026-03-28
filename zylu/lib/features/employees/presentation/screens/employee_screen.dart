import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zylu/core/constants/app_colors.dart';
import 'package:zylu/features/employees/bloc/employee_bloc.dart';
import 'package:zylu/features/employees/bloc/employee_events.dart';
import 'package:zylu/features/employees/bloc/employee_repository.dart';
import 'package:zylu/features/employees/bloc/employee_states.dart';
import 'package:zylu/features/employees/widgets/employee_list_view.dart';
import 'package:zylu/features/employees/widgets/filter_bottom_sheet.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  late final EmployeeBloc _employeeBloc;

  String searchQuery = "";
  String selectedFilter = "all";

  @override
  void initState() {
    super.initState();

    _employeeBloc = EmployeeBloc(repository: EmployeeRepository())
      ..add(FetchEmployees());
  }

  @override
  void dispose() {
    _employeeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocConsumer<EmployeeBloc, EmployeeStates>(
          bloc: _employeeBloc,
          listener: (context, state) {
            if (state is EmployeeError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is EmployeeLoading) {
              return const Center(child: CircularProgressIndicator(
                color: AppColors.primary,
              ));
            }

            if (state is EmployeeError) {
              return Center(
                child: Text(state.message, textAlign: TextAlign.center),
              );
            }

            if (state is EmployeeLoaded) {
              return EmployeeListView(
                employees: state.employees,
                searchQuery: searchQuery,
                selectedFilter: selectedFilter,

                onSearch: (value) {
                  setState(() => searchQuery = value);
                },

                onFilterTap: () => _openFilterSheet(context),
                onRefresh: () async {
                  _employeeBloc.add(FetchEmployees());

                  await Future.delayed(const Duration(seconds: 1));
                },
                gradientColors: AppColors.primaryGradient.colors,
                color: AppColors.primary,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _openFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return FilterBottomSheet(
          selectedFilter: selectedFilter,
          onSelect: (value) {
            setState(() {
              selectedFilter = value;
            });
          },
        );
      },
    );
  }
}
