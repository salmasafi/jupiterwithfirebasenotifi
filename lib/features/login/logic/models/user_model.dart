class UserModel {
  String studentName;
  String nickname;
  String phone;
  String studentWhatsApp;
  String school;
  String comment;
  String age;
  dynamic studentBatches;
  dynamic enrollments;
  String name;
  String role;
  String address;
  String whatsApp;
  bool isActive;
  int jupiterCoins;
  String getStartedAt;
  String branch;
  String dateOfBirth;
  String profileImagePath;
  dynamic assignedByTasks;
  dynamic assignedToTasks;
  dynamic requests;
  String id;
  String userName;
  String normalizedUserName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  String passwordHash;
  String securityStamp;
  String concurrencyStamp;
  String phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  dynamic lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  UserModel({
    required this.studentName,
    required this.nickname,
    required this.phone,
    required this.studentWhatsApp,
    required this.school,
    required this.comment,
    required this.age,
    required this.studentBatches,
    required this.enrollments,
    required this.name,
    required this.role,
    required this.address,
    required this.whatsApp,
    required this.isActive,
    required this.jupiterCoins,
    required this.getStartedAt,
    required this.branch,
    required this.dateOfBirth,
    required this.profileImagePath,
    required this.assignedByTasks,
    required this.assignedToTasks,
    required this.requests,
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
    required this.passwordHash,
    required this.securityStamp,
    required this.concurrencyStamp,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.twoFactorEnabled,
    required this.lockoutEnd,
    required this.lockoutEnabled,
    required this.accessFailedCount,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      studentName: json['studentName'] ?? '',
      nickname: json['nickname'] ?? '',
      phone: json['phone'] ?? '',
      studentWhatsApp: json['studentWhatsApp'] ?? '',
      school: json['school'] ?? '',
      comment: json['comment'] ?? '',
      age: json['age'] ?? '',
      studentBatches: json['studentBatches'] ?? '',
      enrollments: json['enrollments'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      address: json['address'] ?? '',
      whatsApp: json['whatsApp'] ?? '',
      isActive: json['isActive'] ?? '',
      jupiterCoins: json['jupiterCoins'] ?? '',
      getStartedAt: json['getStartedAt'] ?? '',
      branch: json['branch'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      profileImagePath: json['profileImagePath'] ?? 'https://jupiter-academy.org/assets/images/Jupiter%20Outlined.png',
      assignedByTasks: json['assignedByTasks'] ?? '',
      assignedToTasks: json['assignedToTasks'] ?? '',
      requests: json['requests'] ?? '',
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
      normalizedUserName: json['normalizedUserName'] ?? '',
      email: json['email'] ?? '',
      normalizedEmail: json['normalizedEmail'] ?? '',
      emailConfirmed: json['emailConfirmed'] ?? '',
      passwordHash: json['passwordHash'] ?? '',
      securityStamp: json['securityStamp'] ?? '',
      concurrencyStamp: json['concurrencyStamp'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      phoneNumberConfirmed: json['phoneNumberConfirmed'] ?? '',
      twoFactorEnabled: json['twoFactorEnabled'] ?? '',
      lockoutEnd: json['lockoutEnd'] ?? '',
      lockoutEnabled: json['lockoutEnabled'] ?? '',
      accessFailedCount: json['accessFailedCount'] ?? '',
    );
  }
}

/* 
UserModel userModel = UserModel.fromJson({
  "basicSalary": 0,
  "bonus": 0,
  "position": null,
  "instructorBatches": null,
  "name": "Salma Safi",
  "role": "instructor",
  "address": "Agami",
  "whatsApp": "01221918757",
  "isActive": true,
  "jupiterCoins": 0,
  "getStartedAt": "2024-5-12",
  "branch": "Bitash",
  "dateOfBirth": null,
  "profileImagePath":
      "https://web-api.jupiter-academy.org/FileManager/GetImage?ImageName=dbd7a822-e77f-4f8a-9d34-c8a4c2c3420b.jpg",
  "assignedByTasks": null,
  "assignedToTasks": null,
  "requests": null,
  "id": "d666da61-11ed-48d2-bee7-f994d85e6be0",
  "userName": "SalmaSafi",
  "normalizedUserName": "SALMASAFI",
  "email": "salmasafi126@gmail.com",
  "normalizedEmail": "SALMASAFI126@GMAIL.COM",
  "emailConfirmed": false,
  "passwordHash":
      "AQAAAAIAAYagAAAAEI3ObdK2BJB+QkvBQVExJlhn6tqC+N35+oOrKPS0MCgMMiDEYwIiBV1Rku9dvdXAmg==",
  "securityStamp": "PEODR3WZEMY5DZMM67VE6ZKCYL7BJKOD",
  "concurrencyStamp": "3fa197a1-10b2-4ae4-995f-04f6e2d0b2a0",
  "phoneNumber": "01221918757",
  "phoneNumberConfirmed": false,
  "twoFactorEnabled": false,
  "lockoutEnd": "2024-05-13T16:33:58.8174702+00:00",
  "lockoutEnabled": true,
  "accessFailedCount": 2
}); */