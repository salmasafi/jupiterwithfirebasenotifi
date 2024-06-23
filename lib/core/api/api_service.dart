// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:dio/dio.dart';
import 'package:jupiter_academy/features/batches/logic/models/student_model.dart';
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
    Response response = await dio.get('$baseURL/Enrollments/patch-students/$id');
    
    print('Response data: ${response.data}');

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
}
