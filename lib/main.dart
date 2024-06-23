import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jupiter_academy/core/api/notification_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/cubit/jupiter_cubit.dart';
import 'core/widgets/jupiter_widget.dart';
import 'core/widgets/loadingwidget.dart';
import 'features/login/presentation/views/loginscreen.dart';
import 'features/home/presentation/views/homescreen.dart';
import 'features/login/logic/models/user_model.dart';
import 'core/api/api_service.dart';
import 'firebase_options.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseApi().initNotifacations();

  /* FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel); */

    /* await flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'), // تأكد من وجود الأيقونة
    ),
  ); */

  runApp(const MainApp());
}

/* const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', //id
  'High Importance Notifications', //title
  description:
      'This channel is used for important notifications.', //description
  importance: Importance.high,
  playSound: true,
); */

/* final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.messageId);
} */

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('userId');
  }

  Widget _buildHomeScreen() {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const JupiterWidget();
        } else if (snapshot.hasData) {
          final prefs = snapshot.data!;
          final userId = prefs.getString('userId')!;
          return FutureBuilder<UserModel>(
            future: APiService().getUserById(userId),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const JupiterWidget();
              } else if (userSnapshot.hasData) {
                return HomeScreen(userModel: userSnapshot.data!);
              } else {
                return const LoginScreen();
              }
            },
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }

  Future<ThemeMode> _getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    /*return BlocProvider(
      create: (context) => JupiterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    ); */
    return BlocProvider(
      create: (context) => JupiterCubit(),
      child: FutureBuilder<ThemeMode>(
        future: _getThemeMode(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MyLoadingWidget();
          } else {
            final themeMode = snapshot.data ?? ThemeMode.light;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeMode,
              home: FutureBuilder<bool>(
                future: _checkLoginStatus(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const MyLoadingWidget();
                  } else if (snapshot.hasData && snapshot.data == true) {
                    return _buildHomeScreen();
                  } else {
                    return const LoginScreen();
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
