// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jupiter_academy/core/cubit/jupiter_cubit.dart';
import '../../../../core/widgets/build_appbar_method.dart';
import '../../../login/logic/models/user_model.dart';
import '../../logic/image_change_builder.dart';
import '../../../../core/widgets/my_list_tile.dart';
import '../../logic/password_editing_screen.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel userModel;
  const ProfileScreen({
    super.key,
    required this.userModel,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                width: screenWidth * 0.6,
                height: screenWidth * 0.6,
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      BlocBuilder<JupiterCubit, JupiterState>(
                        builder: (context, state) {
                          String imageUrl;
                          if (state is ImageChangedState && state.imageUrl != null) {
                            imageUrl = state.imageUrl!;
                          } else {
                            imageUrl = widget.userModel.profileImagePath != ''
                                ? widget.userModel.profileImagePath
                                : 'https://jupiter-academy.org/assets/images/Jupiter%20Outlined.png';
                          }
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10000),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.fill,
                              height: screenWidth * 0.6,
                              width: screenWidth * 0.6,
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ImageChangeBuilder(userModel: widget.userModel),
                                ),
                              );
                              // تحديث الحالة بعد العودة من صفحة تغيير الصورة
                              BlocProvider.of<JupiterCubit>(context)
                                  .changeImage(widget.userModel.id);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              MyListTile(
                title: 'Name: ${widget.userModel.name}',
              ),
              MyListTile(
                title: 'Role: ${widget.userModel.role}',
              ),
              MyListTile(
                title: 'Branch: ${widget.userModel.branch}',
              ),
              MyListTile(title: 'Email: ${widget.userModel.email}'),
              MyListTile(
                title: 'Password: **************',
                canEdit: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasswordEditingScreen(
                        userModel: widget.userModel,
                      ),
                    ),
                  );
                },
              ),
              MyListTile(
                title: 'Phone: ${widget.userModel.phoneNumber}',
              ),
              MyListTile(
                title: 'WhatsApp: ${widget.userModel.whatsApp}',
              ),
              MyListTile(
                title: 'StartedAt: ${widget.userModel.getStartedAt}',
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
