class Employee {
  final String name;
  final String id;
  // يمكنك إضافة المزيد من البيانات هنا إذا لزم الأمر

  Employee({required this.name, required this.id});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'] ?? 'Unknown',
      id: json['user_id'] ?? 'Unknown',
    );
  }
}