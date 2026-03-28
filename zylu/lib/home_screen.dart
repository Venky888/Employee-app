import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zylu/core/constants/app_colors.dart';
import 'package:zylu/features/employees/presentation/screens/employee_list_screen.dart';
import 'package:zylu/features/employees/presentation/screens/employee_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  late List<Widget> page;
  @override
  void initState() {
    page = [EmployeeListScreen(), EmployeeScreen()];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 24,
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              selectedIndex == 0 ? Iconsax.cloud : Iconsax.cloud_change,
            ),
            label: "Firebase",
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 1 ? Iconsax.data : Iconsax.home),
            label: "Laravel",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }
}
