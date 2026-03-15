import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:practicee/example_app_data/screens/profile.dart';
import 'package:practicee/main.dart';
import 'package:practicee/notifications/screens/notification_page.dart';

class PushNotificationRequestPermissionService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //Request Permission
  void requestPermissionPushNotificationFirebase() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
        providesAppNotificationSettings: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print("Permission Granted");
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        print("Provisional Permission Granted");
      } else {
        Future.delayed(const Duration(seconds: 1)).then((_) {
          AppSettings.openAppSettings(type: AppSettingsType.notification);
        });
      }
    });
  }

  //Get Device Token
  Future<String> getDeviceToken() async {
    String? token;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
        providesAppNotificationSettings: true,
      );
      token = await messaging.getToken();
      print("Device Token $token");
    });
    return token ?? "";
  }

  //intializeLocalNotification
  Future<void> initLocalNotification(
    BuildContext context,
    RemoteMessage message,
  ) async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (payload) {
        handleMessage(context, message);
      },
    );
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  //Firebase init
  Future<void> firebaseInit(BuildContext context) async {
    //FOREGROUNF STATE
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (kDebugMode) {
        print("Notification title ${notification!.title}");
        print("Notification body ${notification.body}");
      }
      //IOS
      if (Platform.isIOS) {
        iosForegroundMessage();
      }
      //ANDROID
      if (Platform.isAndroid) {
        initLocalNotification(context, message);
        showNotification(message);
      }
    });
  }

  //Show notification
  Future<void> showNotification(RemoteMessage message) async {
    int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(
          100000,
        );
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      playSound: true,
      showBadge: true,
      importance: Importance.max,
    );
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: "Channel Description",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      sound: channel.sound,
    );
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    await _flutterLocalNotificationsPlugin.show(
      id: notificationId,
      title: message.notification!.title.toString(),
      body: message.notification!.body.toString(),
      notificationDetails: NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      ),
    );
  }

  //Background and Terminated State
  Future<void> setUpMessage(BuildContext context) async {
    //BACKGROUND
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleMessage(context, message);
    });

    //TERMINATED
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null && message.data.isNotEmpty) {
        handleMessage(context, message);
      }
    });
  }

  //Handle Message
  Future<void> handleMessage(
    BuildContext context,
    RemoteMessage message,
  ) async {
    if (message.data['route'] == '/profile') {
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => Profile(
            remoteMessage: message,
          ),
        ),
      );
    } else {
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => const NotificationPage(),
        ),
      );
    }
  }

  //ios message
  Future iosForegroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
