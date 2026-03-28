import 'package:flutter/material.dart';
import 'package:zylu/core/constants/app_colors.dart';
import 'package:zylu/features/employees/model/employee_model.dart';
import 'package:zylu/features/employees/widgets/employee_list_view.dart';
import 'package:zylu/features/employees/widgets/filter_bottom_sheet.dart';

import 'package:zylu/data/services/employee_service.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final service = EmployeeService();

  String searchQuery = "";
  String selectedFilter = "all";
  late final Stream<List<Employee>> _employeeStream;
@override
  void initState() {
    super.initState();
    _employeeStream = service.getEmployees(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: StreamBuilder<List<Employee>>(
          
           stream: _employeeStream,
          builder: (context, snapshot) {
           
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(
                color: AppColors.secondary,
              ));
            }
        
      
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
        
            final employees = snapshot.data ?? [];
        
            return EmployeeListView(
              employees: employees,
              searchQuery: searchQuery,
              selectedFilter: selectedFilter,
        
              onSearch: (value) {
                setState(() => searchQuery = value);
              },
        
              onFilterTap: () => _openFilterSheet(context),
        
              gradientColors: AppColors.secondaryGradient.colors,
              color: AppColors.secondary,
            );
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
