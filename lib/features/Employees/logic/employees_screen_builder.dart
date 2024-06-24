/*employees.addAll([
              Employee.fromJson(
                {
                  "name": "Rawan Magdy",
                  "role": "Admin",
                  "address": "Alexandria",
                  "whatsApp": "01275507674",
                  "isActive": true,
                  "jupiterCoins": 0,
                  "getStartedAt": "2024-04-05",
                  "branch": "Bitash",
                  "dateOfBirth": null,
                  "profileImagePath":
                      "https://web-api.jupiter-academy.org/FileManager/GetImage?ImageName=9352d16f-8fb1-4155-b05c-3324068164ea.jpg",
                  "paymentInfo": null,
                  "assignedByTasks": null,
                  "assignedToTasks": null,
                  "requests": null,
                  "id": "25194165-f2f3-4032-a621-3e0b1dc5adc3",
                  "userName": "RawanMagdy",
                  "normalizedUserName": "RAWANMAGDY",
                  "email": "Rawan@gmail.com",
                  "normalizedEmail": "RAWAN@GMAIL.COM",
                  "emailConfirmed": false,
                  "passwordHash":
                      "AQAAAAIAAYagAAAAEAbQRKnQesD3KdB+r9L0tF+i40tefWF3gCtBSgyGxwn/4zpe4qqMc0Ps8pavN6/ONw==",
                  "securityStamp": "C7PF5VHJOYQI2JV25GIATZHA7JLNW4R4",
                  "concurrencyStamp": "e730a1be-0e12-4077-b4d2-38a82ca66224",
                  "phoneNumber": "01275507674",
                  "phoneNumberConfirmed": false,
                  "twoFactorEnabled": false,
                  "lockoutEnd": null,
                  "lockoutEnabled": true,
                  "accessFailedCount": 2
                },
              ),
              Employee.fromJson(
                {
                  "name": "Sama Abdalla",
                  "role": "Admin",
                  "address": "البيطاش شهر العسل ش بورصة ",
                  "whatsApp": "01222669102",
                  "isActive": true,
                  "jupiterCoins": 0,
                  "getStartedAt": "2024-05-21",
                  "branch": "Bitash",
                  "dateOfBirth": null,
                  "profileImagePath":
                      "https://web-api.jupiter-academy.org/FileManager/GetImage?ImageName=5391844c-1181-4fa8-a86c-98b4684d9833.jpg",
                  "paymentInfo": null,
                  "assignedByTasks": null,
                  "assignedToTasks": null,
                  "requests": null,
                  "id": "de9622db-e904-4cc7-b421-613d37c9c2a5",
                  "userName": "SamaAbdalla",
                  "normalizedUserName": "SAMAABDALLA",
                  "email": "smabdllh91@gmail.com",
                  "normalizedEmail": "SMABDLLH91@GMAIL.COM",
                  "emailConfirmed": false,
                  "passwordHash":
                      "AQAAAAIAAYagAAAAEA+IBU30y9fZOO2AJub9C6lc6u0zx1sSnT9EEgLcmKbyLpW5rS9IN9DA+Q31G4dxiA==",
                  "securityStamp": "XOTCF2UTYETXDJZKLRRTTET43U7QFVP3",
                  "concurrencyStamp": "59d89fe8-cceb-4a8f-bcc7-e90cec17a305",
                  "phoneNumber": "01222669102",
                  "phoneNumberConfirmed": false,
                  "twoFactorEnabled": false,
                  "lockoutEnd": "2024-06-09T17:04:33.4788072+00:00",
                  "lockoutEnabled": true,
                  "accessFailedCount": 0
                },
              ),
            ]); */

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
                  id: e['id'] ?? '',
                  name: e['name']?? '',
                  role: e['role']?? '',
                  branch: e['branch']?? '',
                  email: e['email']?? '',
                  phone: e['phone']?? '',
                  whatsApp: e['whatsApp']?? '',
                  getStartedAt: e['getStartedAt']?? '',
                  profileImagePath: e['profileImagePath']?? '',
                  paymentInfo: e['paymentInfo']?? '',
                ))
            .toList();
        employees = fetchedEmployees;

        final response2 =
            await dio.get('https://web-api.jupiter-academy.org/api/Admins');

        if (response2.statusCode == 200) {
          final List<dynamic> data = response2.data['data'];
          final List<Employee> fetchedEmployees = data
              .map((e) => Employee(
                    id: e['id'] ?? '',
                    name: e['name']?? '',
                    role: e['role']?? '',
                    branch: e['branch']?? '',
                    email: e['email']?? '',
                    phone: e['phone']?? '',
                    whatsApp: e['whatsApp']?? '',
                    getStartedAt: e['getStartedAt']?? '',
                    profileImagePath: e['profileImagePath']?? '',
                    paymentInfo: e['paymentInfo']?? '',
                  ))
              .toList();
          setState(() {
            employees.addAll(fetchedEmployees);
            employees.addAll([
              Employee(
                name: 'Rawan Magdy',
                id: '25194165-f2f3-4032-a621-3e0b1dc5adc3',
                role: "Admin",
                branch: "Bitash",
                email: "Rawan@gmail.com",
                phone: "01275507674",
                whatsApp: "01275507674",
                getStartedAt: "2024-04-05",
                profileImagePath:
                    "https://web-api.jupiter-academy.org/FileManager/GetImage?ImageName=9352d16f-8fb1-4155-b05c-3324068164ea.jpg",
                paymentInfo: '',
              ),
              Employee(
                name: 'Sama Abdalla',
                id: 'de9622db-e904-4cc7-b421-613d37c9c2a5',
                role: "Admin",
                branch: "Bitash",
                email: "smabdllh91@gmail.com",
                phone: "01222669102",
                whatsApp: "01222669102",
                getStartedAt: "2024-05-21",
                profileImagePath:
                    "https://web-api.jupiter-academy.org/FileManager/GetImage?ImageName=5391844c-1181-4fa8-a86c-98b4684d9833.jpg",
                paymentInfo: '',
              ),
            ]);
          });
        } else {
          throw Exception('Failed to load employees');
        }

        setState(() {});
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
