import 'package:flutter/material.dart';
import 'package:zylu/features/employees/model/employee_model.dart';

class EmployeeCard extends StatelessWidget {
  final Employee emp;
  final bool highlight;

  const EmployeeCard({super.key, required this.emp, required this.highlight});

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF3B5EDF);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
       
        gradient: highlight
            ? LinearGradient(
                colors: [
                  Colors.green.shade200.withOpacity(0.4),
                  Colors.green.shade50,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,

        color: highlight ? null : Colors.grey.shade100,

        borderRadius: BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            color: highlight
                ? Colors.green.withOpacity(0.25)
                : Colors.black.withOpacity(0.06),
            blurRadius: highlight ? 18 : 12,
            offset: const Offset(0, 6),
          ),
        ],

        border: highlight
            ? Border.all(color: Colors.green.withOpacity(0.5))
            : Border.all(color: Colors.grey.withOpacity(0.5)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Row(
            children: [
             
              CircleAvatar(
                radius: 26,
                backgroundColor: highlight
                    ? Colors.green.withOpacity(0.2)
                    : primary.withOpacity(0.1),
                child: Text(
                  emp.name.isNotEmpty ? emp.name[0].toUpperCase() : "?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: highlight ? Colors.green : primary,
                  ),
                ),
              ),

              const SizedBox(width: 12),

          
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            emp.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: highlight
                                  ? Colors.green.shade900
                                  : Colors.black87,
                            ),
                          ),
                        ),

                        Icon(
                          Icons.circle,
                          size: 10,
                          color: emp.isActive ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

              
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            emp.email,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),


          Row(
            children: [
           
              Expanded(
                child: _infoCard(
                  icon: Icons.calendar_today,
                  title: "Joined on",
                  value: emp.joiningDate.toLocal().toString().split(' ')[0],
                  highlight: highlight,
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: _infoCard(
                  icon: Icons.work_outline,
                  title: "Total Experience",
                  value: "${emp.totalExperience} yrs",
                  highlight: highlight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
    required bool highlight,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: highlight ? Colors.white.withOpacity(0.6) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: highlight ? Colors.green : Colors.grey),
          const SizedBox(width: 6),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: highlight ? Colors.green.shade800 : Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
