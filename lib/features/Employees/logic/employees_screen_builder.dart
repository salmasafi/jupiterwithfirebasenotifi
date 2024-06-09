import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'models/employee_model.dart';
import '../presentation/views/employees_screen.dart';

class EmployeesScreenBuilder extends StatefulWidget {
  const EmployeesScreenBuilder({super.key});

  @override
  State<EmployeesScreenBuilder> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreenBuilder> {
  List<Employee> employees = [];

  @override
  void initState() {
    super.initState();
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    try {
      final dio = Dio();
      final response =
          await dio.get('https://web-api.jupiter-academy.org/api/Instructors');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<Employee> fetchedEmployees = data
            .map((e) => Employee(
                  id: e['id'],
                  name: e['name'],
                ))
            .toList();
        employees = fetchedEmployees;
        employees.addAll([
          Employee(
            name: 'Rawan Magdy',
            id: '25194165-f2f3-4032-a621-3e0b1dc5adc3',
          ),
          Employee(
            name: 'Rana Atef',
            id: '0dea209a-78dd-4a31-aeb1-c8c07aefcbaa',
          ),
          Employee(
            name: 'Sama Abdalla',
            id: 'de9622db-e904-4cc7-b421-613d37c9c2a5',
          ),
        ]);
        setState(() {});
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      throw Exception('Failed to load employees: $e');
    }

    try {
      final dio = Dio();
      final response =
          await dio.get('https://web-api.jupiter-academy.org/api/Admins');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<Employee> fetchedEmployees = data
            .map((e) => Employee(
                  id: e['id'],
                  name: e['name'],
                ))
            .toList();
        setState(() {
          employees.addAll(fetchedEmployees);
        });
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      throw Exception('Failed to load employees: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return EmployeesScreen(employees: employees);
  }
}
