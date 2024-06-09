import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifacations () async {
    await _firebaseMessaging.requestPermission(
    );
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert:  true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final fCMToken = _firebaseMessaging.getToken();
    print('Token: $fCMToken');

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('User Granted permission');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('title: ${message.notification!.title.toString()} | body: ${message.notification!.body.toString()}');
    },);
  }
}