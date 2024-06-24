// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:dio/dio.dart';
import 'package:jupiter_academy/features/batches/logic/models/student_model.dart';
import '../../features/Employees/logic/models/employee_model.dart';
import '../../features/batches/logic/models/batch_model.dart';
import '../../features/login/logic/models/user_model.dart';

class APiService {
  static String baseURL = 'https://web-api.jupiter-academy.org/api';

  Dio dio = Dio();

  Future<UserModel> getUserById(String id) async {
    Response response = await dio.get('$baseURL/User/$id');
    Map<String, dynamic> jsonData = response.data;

    return UserModel.fromJson(jsonData);
  }

  Future<String> getUserIdByLogin(String email, String password) async {
    Response response = await dio.post(
      '$baseURL/User/login',
      data: {
        "email": "$email",
        "password": "$password",
      },
    );
    Map<String, dynamic> json = response.data;
    switch (response.statusCode) {
      case 200:
        return json['user_id'];
      default:
        return 'Not Found';
    }
  }

  Future<String> changePassword(
    String id,
    String oldPassword,
    String newPassword,
  ) async {
    Response response = await dio.post(
      '$baseURL/User/changepassword/$id',
      data: {
        "oldPassword": "$oldPassword",
        "newPassword": "$newPassword",
      },
    );

    switch (response.statusCode) {
      case 200:
        return 'Done';
      default:
        return 'Error';
    }
  }

  Future<List<BatchModel>> getBatchById(String id) async {
    List<BatchModel> batchesList = [];
    Response response = await dio.get('$baseURL/Batches/instructor/$id');

    print('Response data: ${response.data}');

    Map<String, dynamic> jsonData = response.data;
    List batches = jsonData['data'];
    for (var batch in batches) {
      batchesList.add(BatchModel.fromJson(batch));
    }
    return batchesList;
  }

  Future<List<StudentModel>> getStudentsByBatchId(String id) async {
    List<StudentModel> studentsList = [];
    Response response =
        await dio.get('$baseURL/Enrollments/patch-students/$id');

    List jsonData = response.data;
    for (var student in jsonData) {
      studentsList.add(StudentModel.fromJson(student));
    }
    return studentsList;
  }

  Future<String> getUserImageById(String id) async {
    Response response = await dio.get('$baseURL/User/$id');
    Map<String, dynamic> jsonData = response.data;

    return jsonData['profileImagePath'];
  }

  Future<List<Employee>> getEmployees() async {
    try {
      final dio = Dio();
      final response =
          await dio.get('https://web-api.jupiter-academy.org/api/User/Employee');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        final List<Employee> fetchedEmployees = data
            .map((e) =>  Employee(
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

            for (int i = 0 ; i < fetchedEmployees.length; i++) {
              if (fetchedEmployees[i].role == 'manager' || fetchedEmployees[i].role == 'Manager' || fetchedEmployees[i].name == 'Nardeen Adel ') {
                fetchedEmployees.removeAt(i);
              }
            }
        fetchedEmployees.removeAt(0);
        return fetchedEmployees;
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      throw Exception('Failed to load employees: $e');
    }
  }

}
