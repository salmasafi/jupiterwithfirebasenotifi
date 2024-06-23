// ignore_for_file: use_build_context_synchronously

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/cubit/jupiter_cubit.dart';
import '../../../Employees/logic/employees_screen_builder.dart';
import '../../../attendance/logic/attendance_screen_builder.dart';
import '../../../batches/presentation/views/batches_screen.dart';
import '../../../checkin&out/presentation/views/checkinout_screen.dart';
import '../../../login/logic/models/user_model.dart';
import '../../../login/presentation/views/loginscreen.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';
import '../../../profile_editing.dart/presentation/views/profilescreen.dart';

class MyDrawer extends StatelessWidget {
  final UserModel userModel;
  const MyDrawer({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: myPurple,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<JupiterCubit, JupiterState>(
                      builder: (context, state) {
                        String imageUrl;
                        if (state is ImageChangedState && state.imageUrl != null) {
                          imageUrl = state.imageUrl!;
                        } else {
                          imageUrl = userModel.profileImagePath != ''
                              ? userModel.profileImagePath
                              : 'https://jupiter-academy.org/assets/images/Jupiter%20Outlined.png';
                        }
                        return CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(imageUrl),
                        );
                      },
                    ),
                    


                  const SizedBox(height: 10),
                  Text(
                    userModel.name,
                    style: Styles.style24,
                  ),
                ],
              ),
            ),
          ),
          (userModel.role == 'Instructor' || userModel.role == 'instructor' || userModel.role == 'Admin' || userModel.role == 'admin' || userModel.role == 'Manager' || userModel.role == 'manager') ? ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Check-in & Out'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckInOutScreen(
                    userModel: userModel,
                  ),
                ),
              );
            },
          ) : const SizedBox(),
          (userModel.role == 'Instructor' || userModel.role == 'instructor' || userModel.role == 'Admin' || userModel.role == 'admin' || userModel.role == 'Manager' || userModel.role == 'manager') ? ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Attendance'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AttendanceScreenBuilder(
                    userId: userModel.id,
                  ),
                ),
              );
            },
          ): const SizedBox(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen(userModel: userModel,)),
              );
            },
          ),
          
          (userModel.role == 'Instructor' || userModel.role == 'instructor')
              ? ListTile(
                  leading: const Icon(Icons.home_work),
                  title: const Text('My Batches'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BatchesScrennBuilder(userModel: userModel),
                      ),
                    );
                  },
                )
              : const SizedBox(),
          (userModel.role == 'Manager' || userModel.role == 'manager' || userModel.id == 'd666da61-11ed-48d2-bee7-f994d85e6be0') ? ListTile(
            leading: const Icon(Icons.manage_accounts),
            title: const Text('Employees'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmployeesScreenBuilder(),
                ),
              );
            },
          ) : const SizedBox(),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () async {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(
                    userModel: userModel,
                  ),
                ),
              ); */

              await FirebaseMessaging.instance.getToken().then((token){
                print('My Token is $token');
              });
            },
          ),

          const Spacer(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('userId');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
