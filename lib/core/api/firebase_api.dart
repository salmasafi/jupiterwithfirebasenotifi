import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;

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

  /* Future<String> getAcssesToken () async {
    final serviceAccountJson = {
  "type": "service_account",
  "project_id": "jupiter-test-796b1",
  "private_key_id": "49677ee39819a29cc4698ccb78590d851d7ee5a3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCtCOhYqhqq5FyE\nhPO+nEozl03yBNfBefV2e53Up+gzMr+z4XLmxzfT1ngC6VYp274GX/K9cQDMA6yZ\npIldVykgw9yk+t0X86ST+E4rMVTRuj3+wL38yi2VQGEQMvV8XbpqZevOwAZIIwgf\nwgtawhEPTfu/fdDYjdpy/3brdy3ninikeCdCxWubgByNBIiNaK+nqSW1pdtPRV/g\nD62Yt/8vYtdO4mw6hiM4C63FjsGlsCxErt35nfRDH9Vw5Kg3ISzyn4GfO5Gx+PLm\nl6DuC3htYSY60qPuWDF4xidkSbpBYMwtGHvgwSNQoNIHdT+6JEqD5q0wcvKF7jZr\nSKFzrRDrAgMBAAECggEAO0vap4u/cMGqDMWs66yOZwiaLu5G66f6HJy3FQlnMqhY\n9nEzWW96q68K2GCS5OxHPdMCkbXYYpF9w/cVFbYJQ4+rHKRVQOB/DTAhxX51xRtQ\nJG1zjd3Q6h0yRgVYh8Js4ApGWUcHwA+1OIDcOEFZ7Ec6lsAsYhGWgyMVYxKn2fjT\nB1pMQ9gYGj1M4DkL0NDMAnAIW+sJO64+dBW4VBXVugU9zPJExBWucWxzwmA9TgYZ\nBZGhUpNv5nRkOs3O+pYZrlaUvxUF1C9t9g1CTPsQdFN7O7/oa0f/SYNukTq/fOUy\nmyzuvbFiatOtvPnLKVDzG0YlvOpqT0ZIKJdoO7JryQKBgQDbevMqY/QgBvNiIWzg\n62wTDyBuN0N8pNYlq8KmKfDH19KU+e482ruh17hPihyJR0Jxt6fnv4/pP3FWzEUR\nXbOPbV8/jYSANhIAlFVAt8aSunI/O47INsCmZ/K1ny0JlYAYVHIAi1jxlqCb6ycv\nwEbXaEmBxtv3fRMw8elizXN5swKBgQDJ0407xHE89pSdZ4Sp+g7ue26zifMU4PvU\nfqc+74r7OfYQWJEEzSPtvN+sgn6zJ1y0PtXbZbiAQJZ5rq6x9PYJ8OAhinWlWM1i\nEdeWfBI8bBuEPbBiZFAyhQuvaDslLsBAB7uNrEDIGN849WCuSAZ97bDjrdgTm7YC\nnsJmMj7/6QKBgQCYVynLRZ+gT1LFzS+WmrHkNL6s4bz9Gijt8t9jmH7hJ4OqFiRv\npt9PwbzTsKiH/Kc46WIo8IUCQB/6QES8fg5xQlg3c5IBsAYk0tCt4CF7nOBJ1ZwQ\nijiECGil+fs3yMYlnQ+YIyC0Z3nJX5pOgaZqQ5+p7Y6mpPEaKv90reg2EwKBgFMs\nW4fF7OSyuYwknQdvhbfCJlzW/NYd4aowh7vn+96MhFs4JItV/vh6XbM6E/zAu/OL\n8ZX41ZAFDf4XfubXjI2MNtGbvd/mOL2xnKbnepxr8OsOgSILNQGc0rP2wGkSWygI\nB8Laude8aEGQ3cb057f9vGgXvHRYNyndQz/adRwBAoGABgkQ6doW1O+a7RzWJs+O\nMOhvvv1KwXWpJRgSS93WHNLkmncCFIDNq0jzInnOoPQD5Vj4rvWV8hs+TIAuWzi8\nxL3vS4mhUm/d0tzt7BTHPjciSoEixLlgZdB6rfoHo8iMIjRI8AoKFnkQ7vOR98ZC\nhmfniQwKCgN7+rmquawD3dw=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-wchan@jupiter-test-796b1.iam.gserviceaccount.com",
  "client_id": "108263553868865633506",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-wchan%40jupiter-test-796b1.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
};

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();

    return credentials.accessToken.data;
  } */


} 