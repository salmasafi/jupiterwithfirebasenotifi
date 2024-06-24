import 'package:flutter/material.dart';
import '../../../../core/widgets/build_appbar_method.dart';
import '../../logic/month_screen_builder.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({
    super.key,
    required this.months,
    required this.userId,
  });

  final List<String> months;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: months.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(months[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MonthDetailsScreenBuilder(
                      userId: userId,
                      month: months[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
