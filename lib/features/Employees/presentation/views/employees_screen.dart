import 'package:flutter/material.dart';
import '../../../../core/widgets/build_appbar_method.dart';
import '../../logic/models/employee_model.dart';
import 'employee_data.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({
    super.key,
    required this.employees,
  });

  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeData(
                    employee: employees[index],
                  ),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(employees[index].name),
              ),
            ),
          );
        },
      ),
    );
  }
}
