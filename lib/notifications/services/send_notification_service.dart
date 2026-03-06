import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practicee/notifications/services/get_server_key.dart';

class SendNotificationService {
  static Future<void> sendNotificationUsingApi({
    required String? deviceToken,
    required String? title,
    required String? body,
    required Map<String, dynamic>? data,
  }) async {
    String serverKey = await GetServerkey.getServerKeyToken();
    String url =
        "https://fcm.googleapis.com/v1/projects/notification-practice-81f66/messages:send";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    };
    Map<String, dynamic> message = {
      "message": {
        "token": deviceToken,
        "notification": {
          "title": title,
          "body": body,
        },
        "data": data
      }
    };
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(message),
    );
    if (response.statusCode == 200) {
      print("Notification Sent");
    } else {
      print(response.body);
      print("Notification Not Sent");
    }
  }
}
