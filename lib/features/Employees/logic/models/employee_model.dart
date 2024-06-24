import '../../../login/logic/models/user_model.dart';

class Employee extends UserModel {
  Employee({
    required super.name,
    required super.id,
    required super.role,
    required super.branch,
    required super.email,
    required super.phone,
    required super.whatsApp,
    required super.getStartedAt,
    required super.profileImagePath,
    required super.paymentInfo,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'] ?? '',
      id: json['user_id'] ?? '',
      role: json['role'],
      branch: json['branch'],
      email: json['email'],
      phone: json['phone'],
      whatsApp: json['whatsApp'],
      getStartedAt: json['getStartedAt'],
      profileImagePath: json['profileImagePath'],
      paymentInfo: json['paymentInfo'],
    );
  }
}
