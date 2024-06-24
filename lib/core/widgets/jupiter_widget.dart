import 'package:flutter/material.dart';

class JupiterWidget extends StatelessWidget {
  const JupiterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SizedBox(
        height: 250,
        width: 250,
        child: Image.asset(
          'assets/images/logo.jpg',
          fit: BoxFit.fill,
        ),
      )),
    );
  }
}
