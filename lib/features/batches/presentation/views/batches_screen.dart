// ignore_for_file: unnecessary_cast, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jupiter_academy/core/utils/styles.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/errorwidget.dart';
import '../../../../core/widgets/loadingwidget.dart';
import '../../../../features/batches/logic/batch_model.dart';
import '../../../../features/login/logic/models/user_model.dart';
import '../../../../core/widgets/build_appbar_method.dart';

class BatchesScrennBuilder extends StatefulWidget {
  final UserModel userModel;
  const BatchesScrennBuilder({super.key, required this.userModel});

  @override
  State<BatchesScrennBuilder> createState() => _BatchesScrennBuilderState();
}

class _BatchesScrennBuilderState extends State<BatchesScrennBuilder> {
  late Future<List<BatchModel>> _batchesFuture;

  @override
  void initState() {
    super.initState();
    _batchesFuture =
        APiService().getBatchById(widget.userModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _batchesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MyLoadingWidget();
        } else if (snapshot.hasError) {
          return const MyErrorWidget();
        } else if (!snapshot.hasData ||
            (snapshot.data as List<BatchModel>).isEmpty) {
          return Scaffold(
            appBar: buildAppBar(),
            body: const Center(
              child: Text('There are no batches'),
            ),
          );
        } else {
          return BatchesScreen(
            batchesList: snapshot.data! as List<BatchModel>,
          );
        }
      },
    );
  }
}

class BatchesScreen extends StatelessWidget {
  final List<BatchModel> batchesList;
  const BatchesScreen({super.key, required this.batchesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Total Batches: ${batchesList.length}', style: Styles.style25,),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Card(
                    color: myPurple.withOpacity(0.5),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'BatchName: ${batchesList[index].batchName}',
                            style: Styles.style22,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'CourseName: ${batchesList[index].course_Name}',
                            style: Styles.style22,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'BatchType: ${batchesList[index].batchType}',
                            style: Styles.style22,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'SessionDay: ${batchesList[index].session_Day}',
                            style: Styles.style22,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'SessionTime: ${batchesList[index].session_Time}:00',
                            style: Styles.style22,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'StartingTime: ${batchesList[index].startingTime}',
                            style: Styles.style22,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'GivenSessionsNumber: ${batchesList[index].sessionsGivenNo}',
                            style: Styles.style22,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Status: ${batchesList[index].status}',
                            style: Styles.style22,
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                );
              },
              itemCount: batchesList.length,
            ),
          ],
        ),
      ),
    );
  }
}
