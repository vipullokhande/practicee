import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:practicee/notifications/utilities.dart';

@pragma('vm:entry-point')
Future<void> onActionNotificationMethod(ReceivedAction receivedAction) async {
  print('Notification action received: ${receivedAction.buttonKeyPressed}');
}

@pragma('vm:entry-point')
Future<void> onDismissMethod(ReceivedAction receivedAction) async {
  await AwesomeNotifications().setGlobalBadgeCounter(0);
}

@pragma('vm:entry-point')
Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification) async {
  print('Notification created: ${receivedNotification.id}');
}

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();
  static initNotificationService() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          ledColor: Colors.white,
        )
      ],
    );
    await AwesomeNotifications().setListeners(
      onDismissActionReceivedMethod: onDismissMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onActionReceivedMethod: onActionNotificationMethod,
    );
  }

  static Future<void> createProfilePageNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: 'Profile',
        body: 'Have a GOOD DAY',
        bigPicture: 'assets/aventador.png',
        notificationLayout: NotificationLayout.BigPicture,
        payload: {
          'route': '/profile',
          'id': '123',
        },
      ),
    );
  }

  static Future<void> createHomePageNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title: 'Home',
        body: 'Have a GOOD DAY',
        bigPicture: 'assets/aventador.png',
        notificationLayout: NotificationLayout.BigPicture,
        payload: {
          'route': '/home',
          'id': '123',
        },
      ),
    );
  }
}
