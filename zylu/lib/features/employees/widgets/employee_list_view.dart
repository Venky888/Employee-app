import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zylu/core/constants/app_colors.dart';
import 'package:zylu/core/utils/employee_utils.dart';
import 'package:zylu/features/employees/model/employee_model.dart';
import 'package:zylu/features/employees/widgets/app_search_bar.dart';
import 'package:zylu/features/employees/widgets/employee_card.dart';
import 'package:zylu/features/employees/widgets/header.dart';

class EmployeeListView extends StatelessWidget {
  final List<Employee> employees;
  final String searchQuery;
  final String selectedFilter;
  final Function(String) onSearch;
  final VoidCallback onFilterTap;
  final List<Color> gradientColors;
  final Color color;
  final Future<void> Function()? onRefresh;

  const EmployeeListView({
    super.key,
    required this.employees,
    required this.searchQuery,
    required this.selectedFilter,
    required this.onSearch,
    required this.onFilterTap,
    required this.gradientColors,
    required this.color,
   this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = EmployeeUtils.filterEmployees(
      employees: employees,
      query: searchQuery,
      filter: selectedFilter,
    );

 return Column(
      children: [
        Headrer(gradientColors: gradientColors, color: color),

        const SizedBox(height: 15),

        SearchFilterBar(
          onSearch: onSearch,
          onFilterTap: onFilterTap,
          gradientColors: gradientColors,
          color: color,
        ),

        Expanded(
          child: filteredEmployees.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Iconsax.user, size: 40, color: color),
                      const SizedBox(height: 10),
                      const Text("No employees found"),
                    ],
                  ),
                )
              : (onRefresh != null
                    ? RefreshIndicator(
                      color: AppColors.primaryLight,
                        onRefresh: onRefresh!,
                        
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(12),
                          itemCount: filteredEmployees.length,
                          itemBuilder: (context, index) {
                            final emp = filteredEmployees[index];

                            return EmployeeCard(
                              emp: emp,
                              highlight: EmployeeUtils.isSenior(emp),
                            );
                          },
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: filteredEmployees.length,
                        itemBuilder: (context, index) {
                          final emp = filteredEmployees[index];

                          return EmployeeCard(
                            emp: emp,
                            highlight: EmployeeUtils.isSenior(emp),
                          );
                        },
                      )),
        ),
      ],
    ); }
}
