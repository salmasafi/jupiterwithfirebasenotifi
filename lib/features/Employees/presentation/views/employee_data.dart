import 'package:flutter/material.dart';
import 'package:jupiter_academy/features/attendance/logic/attendance_screen_builder.dart';
import '../../../../core/widgets/build_appbar_method.dart';
import '../../../../core/widgets/my_list_tile.dart';
import '../../../profile_editing.dart/presentation/views/profilescreen.dart';
import '../../logic/models/employee_model.dart';



class EmployeeData extends StatelessWidget {
  final Employee employee;
  const EmployeeData({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MySquareTile(title: '${employee.name}\'s profile', height: 220, onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(userModel: employee),),);
              },),
              MySquareTile(title: '${employee.name}\'s checkouts', height: 220, onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AttendanceScreenBuilder(userId: employee.id,),),);
              },),
            ],
          ),
        ),
      ),
    );
  }
}