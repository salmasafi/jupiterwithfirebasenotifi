import 'package:flutter/material.dart';
import '../../../../core/widgets/build_appbar_method.dart';
import '../../../../core/widgets/loadingwidget.dart';
import '../../../attendance/logic/attendance_screen_builder.dart';
import '../../logic/models/employee_model.dart';

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
      body: employees != []
          ? ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceScreenBuilder(
                          userId: employees[index].id,
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
            )
          : const MyLoadingWidget()
    );
  }
}
