import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_functions/cloud_functions.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifacations() async {
    await _firebaseMessaging.requestPermission();
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final fCMToken = _firebaseMessaging.getToken();
    print('Token: $fCMToken');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User Granted permission');
    }

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print(
            'title: ${message.notification!.title.toString()} | body: ${message.notification!.body.toString()}');
      },
    );
  }

  Future<void> sendNotification({
    required String title,
    required String body,
    required String token,
  }) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('sendNotification');

    try {
      final response = await callable.call(<String, dynamic>{
        'token': token,
        'title': title,
        'body': body,
      });

      if (response.data['success']) {
        print('Notification sent successfully.');
        //return true;
      } else {
        print('Failed to send notification: ${response.data['error']}');
        //return false;
      }
    } catch (e) {
      print('There is an error $e');
      //return false;
    }
  }
}
