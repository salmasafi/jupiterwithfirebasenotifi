import 'package:flutter/material.dart';
import 'package:jupiter_academy/core/utils/styles.dart';
import '../../../../core/widgets/build_appbar_method.dart';

class MonthDetailsScreen extends StatelessWidget {
   const MonthDetailsScreen({
    super.key,
    required this.checkInOuts,
  });

  final List<Map<String, dynamic>> checkInOuts;
  

  Map<String, dynamic> calculateMonthWorkTime(final List<Map<String, dynamic>> checkInOuts){
    num totalMonthWorkTimeAsMinutes = 0;
    for (var checkInOut in checkInOuts) {
      totalMonthWorkTimeAsMinutes += checkInOut['totalWorkTimeAsMinutes'] as int;
      
    }

    print(totalMonthWorkTimeAsMinutes);

    Map<String, dynamic> totalWorkTime = {'hours': 0, 'minutes' : 0};

    while (totalMonthWorkTimeAsMinutes > 60) {
      totalMonthWorkTimeAsMinutes  -= 60;
      totalWorkTime['hours'] += 1;
    }

    totalWorkTime['minutes'] = totalMonthWorkTimeAsMinutes;


    return totalWorkTime;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total work time this month:\n${checkInOuts.length} days, with total ${calculateMonthWorkTime(checkInOuts)['hours']} hours, ${calculateMonthWorkTime(checkInOuts)['minutes']} minutes of work!',
                style: Styles.style25,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: checkInOuts.length,
              itemBuilder: (context, index) {
                final data = checkInOuts[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      data['date'],
                      style: Styles.style18,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Check-In: ',
                              style: Styles.style16Bold,
                            ),
                            Text(
                              '${data['checkIn']}',
                              style: Styles.style16,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Check-Out: ',
                              style: Styles.style16Bold,
                            ),
                            Text(
                              '${data['checkOut']}',
                              style: Styles.style16,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Total Work Time: ',
                              style: Styles.style16Bold,
                            ),
                            Text(
                              '${data['totalWorkTime']['hours'] ?? 0} hours, ${data['totalWorkTime']['minutes'] ?? 0} minutes',
                              style: Styles.style16,
                            ),
                          ],
                        ),
                        Text(
                          'Check-Out-details:',
                          style: Styles.style16Bold,
                        ),
                        Text(
                          '${data['checkOutDetails']}',
                          style: Styles.style16,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
