import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:poultrypal/app.dart';
import 'package:poultrypal/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getToken();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 6), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const MyHomePage(), // Replace with your actual next screen
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    // flutterLocalNotificationsPlugin.cancelAll();
    super.dispose();
  }

  void getToken() {
    FirebaseMessaging.instance.getToken().then((value) {
      debugPrint('TOKEN IS :: :: $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color
      body: Center(child: Assets.splash2.image()),
    );
  }
}

late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;
Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) async {
  final notification = message.notification;
  final android = message.notification?.android;
  debugPrint('Remote Notification : ${notification?.title}');
  debugPrint(
      'Android Notification : ${android?.count} || ${android?.imageUrl}');

  if (notification != null && android != null && !kIsWeb) {
    final isImg = android.imageUrl;
    if (isImg != null) {
      debugPrint('Image is not null');
      final bigPicture =
          ByteArrayAndroidBitmap(await _getByteArrayFromUrl(isImg));
      debugPrint('bigPICTURE');

      final bigPictureStyleInformation =
          BigPictureStyleInformation(
        bigPicture,
      );
      debugPrint('bigPICTURE style');

      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              styleInformation: bigPictureStyleInformation,
              icon: 'app_icon'
              // ... other notification details
              ),
        ),
      );
    } else {
      debugPrint('Image is null');
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description, icon: 'app_icon'
              // ... other notification details
              ),
        ),
      );
    }

    // Optional check for existing notification (uncomment if needed)
    // final existingNotificationId = notification.hashCode;
    // if (!flutterLocalNotificationsPlugin.pendingNotificationRequests(ListNotificationDetails({}).toList())
    //     .any((pending) => pending.id == existingNotificationId)) {

    // }
  }
}

Future<Uint8List> _getByteArrayFromUrl(String url) async {
  final response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
