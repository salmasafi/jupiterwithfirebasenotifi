// ignore_for_file: avoid_print, body_might_complete_normally_nullable

//import 'dart:io';
//import 'package:http/http.dart' as http;
//import 'package:http_parser/http_parser.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:mime/mime.dart';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
//import '../../../../core/api/api_service.dart';
import '../../../../core/widgets/mybutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/build_appbar_method.dart';
import '../../../login/logic/models/user_model.dart';
import '../../logic/calculatetime_method.dart';

class CheckInOutScreen extends StatefulWidget {
  final UserModel userModel;
  const CheckInOutScreen({super.key, required this.userModel});

  @override
  State<CheckInOutScreen> createState() => _CheckInOutScreenState();
}

class _CheckInOutScreenState extends State<CheckInOutScreen> {
  //File? image;
  //final _picker = ImagePicker();
  bool showSpinner = false;
  bool isCheckOutDone = true;
  String checkOutDetails = '......';
  String checkOutDetailsTemp = '......';
  String checkIn = '--/--';
  String checkOut = '--/--';
  Map<String, dynamic> totalWorkTime = {};

  @override
  void initState() {
    _getCheckInOuts();
    super.initState();
  }

  _getCheckInOuts() async {
    try {
      DocumentReference employeeDoc = FirebaseFirestore.instance
          .collection('Employees')
          .doc(widget.userModel.id)
          .collection('CheckInOuts')
          .doc(DateFormat('MMMM yyyy').format(DateTime.now()))
          .collection('Dates')
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()));

      DocumentSnapshot employeeSnapshot = await employeeDoc.get();
      if (employeeSnapshot.exists) {
        if (employeeSnapshot['checkOutDetails'] == '......') {
          isCheckOutDone = false;
        }
        setState(() {
          checkIn = employeeSnapshot['checkIn'];
          checkOut = employeeSnapshot['checkOut'];
          totalWorkTime = employeeSnapshot['totalWorkTime'];
        });
        print(
            'Data fetched successfully: checkIn: $checkIn, checkOut: $checkOut, totalWorkTime: $totalWorkTime');
      } else {
        setState(() {
          checkIn = '--/--';
          checkOut = '--/--';
          totalWorkTime = {'hours': 0, 'minutes': 0};
        });
        print('Document does not exist.');
      }
    } catch (e) {
      setState(() {
        checkIn = '--/--';
        checkOut = '--/--';
        totalWorkTime = {'hours': 0, 'minutes': 0};
      });
      print('Error fetching data: $e');
    }
  }

  /* Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadImage() async {
    if (image == null) {
      return;
    }

    setState(() {
      showSpinner = true;
    });

    var uri = Uri.parse(
        '${APiService.baseURL}/User/changeProfilePic/${widget.userModel.id}');
    var request = http.MultipartRequest('POST', uri);

    var mimeTypeData =
        lookupMimeType(image!.path, headerBytes: [0xFF, 0xD8])?.split('/');
    if (mimeTypeData == null || mimeTypeData.length != 2) {
      return;
    }

    var multipartFile = await http.MultipartFile.fromPath(
      'picture',
      image!.path,
      contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
    );
    request.files.add(multipartFile);

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        var responseBody = await http.Response.fromStream(response);
        print(responseBody.body);
        setState(() {});
      } else {
        print('Image upload failed with status: ${response.statusCode}');
        var responseBody = await http.Response.fromStream(response);
        print(responseBody.body);
      }
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }
 */

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: buildAppBar(),
      body: //ModalProgressHUD(
          //inAsyncCall: showSpinner,
          /*child:*/ SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: screenHeight * 0.02),
              child: Text(
                'Welcome!',
                style: Styles.style25,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Employee ${widget.userModel.name}',
                style: Styles.style25,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today\'s Status',
                style: Styles.style25,
              ),
            ),
            Container(
              height: screenHeight * 0.2,
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: myPurple,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Check In',
                          style: Styles.style20,
                        ),
                        Text(
                          checkIn,
                          style: Styles.style20,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Check Out',
                          style: Styles.style20,
                        ),
                        Text(
                          checkOut,
                          style: Styles.style20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '${DateTime.now().day.toString()} ${DateFormat('MMMM yyyy').format(DateTime.now())}',
                style: Styles.style16,
              ),
            ),
            StreamBuilder(
              stream: Stream.periodic(
                const Duration(seconds: 1),
              ),
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('hh:mm:ss a').format(DateTime.now()).toString(),
                    style: Styles.style18,
                  ),
                );
              },
            ),
            checkOut == '--/--'
                ? Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.03),
                    child: Builder(
                      builder: (context) {
                        final GlobalKey<SlideActionState> key = GlobalKey();
                        return SlideAction(
                          outerColor: myPurple.withOpacity(0.5),
                          text: checkIn == '--/--'
                              ? 'Slide to Check In'
                              : 'Slide to Check Out',
                          textStyle: Styles.style20,
                          key: key,
                          onSubmit: () async {
                            key.currentState!.reset();
                            isCheckOutDone = false;
                            DocumentReference employeeDoc2 = FirebaseFirestore
                                .instance
                                .collection('Employees')
                                .doc(widget.userModel.id)
                                .collection('CheckInOuts')
                                .doc(DateFormat('MMMM yyyy')
                                    .format(DateTime.now()))
                                .collection('Dates')
                                .doc(DateFormat('dd MMMM yyyy')
                                    .format(DateTime.now()));
                            DocumentSnapshot employeeSnapshot2 =
                                await employeeDoc2.get();
                            if (employeeSnapshot2.exists) {
                              checkOut =
                                  DateFormat('hh:mm a').format(DateTime.now());

                              totalWorkTime = calculateTimeDifference(
                                startTime: checkIn,
                                endTime: checkOut,
                              );

                              await employeeDoc2.update({
                                'checkOut': checkOut,
                                'totalWorkTime': totalWorkTime,
                              });
                              setState(() {});
                            } else {
                              await employeeDoc2.set({
                                'checkIn': DateFormat('hh:mm a')
                                    .format(DateTime.now()),
                                'checkOut': '--/--',
                                'totalWorkTime': {'hours': 0, 'minutes': 0},
                                'checkOutDetails': '......'
                              });
                              setState(() {
                                checkIn = DateFormat('hh:mm a')
                                    .format(DateTime.now());
                              });
                            }
                          },
                        );
                      },
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(vertical: 32),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: myGrey,
                              blurRadius: 50,
                              offset: Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'You have completed ${totalWorkTime['hours'] ?? 0} hours, ${totalWorkTime['minutes'] ?? 0} minutes of work!',
                            style: Styles.style25,
                          ),
                        ),
                      ),
                      isCheckOutDone == false && checkOutDetails == '......'
                          ? Column(
                              children: [
                                TextField(
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: 'Type your checkout here.......',
                                    border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: myPurple),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    checkOutDetailsTemp = value;
                                  },
                                ),
                                /* const SizedBox(height: 10,),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    width: screenWidth * 0.4,
                                    height: screenHeight * 0.07,
                                    child: const Center(
                                      child: Text(
                                        'Pick an image',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                               */
                              ],
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        title: 'SUBMIT',
                        onPressed: () async {
                          checkOutDetails = checkOutDetailsTemp;
                          if (isCheckOutDone == false && checkOutDetails != '......') {
                            DocumentReference employeeDoc3 = FirebaseFirestore
                                .instance
                                .collection('Employees')
                                .doc(widget.userModel.id)
                                .collection('CheckInOuts')
                                .doc(DateFormat('MMMM yyyy')
                                    .format(DateTime.now()))
                                .collection('Dates')
                                .doc(DateFormat('dd MMMM yyyy')
                                    .format(DateTime.now()));
                            DocumentSnapshot employeeSnapshot3 =
                                await employeeDoc3.get();
                            if (employeeSnapshot3.exists) {
                              checkOut =
                                  DateFormat('hh:mm a').format(DateTime.now());

                              totalWorkTime = calculateTimeDifference(
                                startTime: checkIn,
                                endTime: checkOut,
                              );

                              await employeeDoc3.update({
                                //'checkOut': checkOut,
                                //'totalWorkTime': totalWorkTime,
                                'checkOutDetails': checkOutDetails,
                              });

                              isCheckOutDone = true;
                              setState(() {});
                            }
                          }
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
      //),
    );
  }
}
