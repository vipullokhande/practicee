import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:practicee/notifications/services/notification_service.dart';
import 'package:practicee/notifications/services/send_notification_service.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    allow();
  }

  Future<void> allow() async {
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (isAllowed == false) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Allow Notifications',
            ),
            content: const Text(
              'Our app like to send you notifications',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Dont allow'),
              ),
              TextButton(
                onPressed: () => AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((_) => Navigator.of(context).pop()),
                child: const Text('Allow'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Image.asset(
              'assets/aventador.png',
              height: 200,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async =>
                      await NotificationService.createProfilePageNotification(),
                  child: const Text('Profile'),
                ),
                ElevatedButton(
                  onPressed: () async =>
                      await NotificationService.createHomePageNotification(),
                  child: const Text('Home'),
                ),
                ElevatedButton(
                  onPressed: () async =>
                      await SendNotificationService.sendNotificationUsingApi(
                    deviceToken: "",
                    title: "Test Notification",
                    body: "Test Body",
                    data: {"route": '/profile'},
                  ),
                  child: const Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
