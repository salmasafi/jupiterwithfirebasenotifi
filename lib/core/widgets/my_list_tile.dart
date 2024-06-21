// ignore_for_file: must_be_immutable

import '../utils/constants.dart';
import 'package:flutter/material.dart';
import '../utils/styles.dart';

class MyListTile extends StatelessWidget {
  final String title;
  bool canEdit;
  VoidCallback? onTap;

  MyListTile({
    super.key,
    required this.title,
    this.canEdit = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: myPurple.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        title: Text(
          title,
          style: Styles.style22,
        ),
        trailing: canEdit != false
            ? IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.edit),
              )
            : null,
      ),
    );
  }
}


class MySquareTile extends StatelessWidget {
  final String title;
  //bool canEdit;
  double? width;
  double? height;
  VoidCallback? onTap;

  MySquareTile({
    super.key,
    required this.title,
    //this.canEdit = false,
    this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
      color: myPurple.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20),
        ),
        height: height,
        width: width,
        
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: ListTile(
            //contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            title: Center(
              child: Text(
                title,
                style: Styles.style22,
              ),
            ),
            /* trailing: canEdit != false
                ? IconButton(
                    onPressed: onTap,
                    icon: const Icon(Icons.edit),
                  )
                : null,*/
          ), 
        ),
      ),
    );
  }
}
