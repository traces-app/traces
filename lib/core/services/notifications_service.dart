import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    try {
      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (kDebugMode) {
        print(
            "Notification permissions granted: ${settings.authorizationStatus}");
      }

      String? token = await getToken();
      if (kDebugMode) {
        print("FCM Token: $token");
      }

      if (token != null) {
        await _sendTokenIfNeeded(token);
      }

      await _initializeLocalNotifications();

      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

      _handleInitialMessage();

      FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
        if (kDebugMode) {
          print("FCM Token refreshed: $newToken");
        }
        await _sendTokenIfNeeded(newToken);
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error initializing Firebase Messaging: $e");
      }
    }
  }

  // get the FCM token
  Future<String?> getToken() async {
    try {
      String? token = await _messaging.getToken();
      return token;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting FCM token: $e");
      }
      return null;
    }
  }

  Future<void> _sendTokenIfNeeded(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastToken = prefs.getString('fcm_token');

    if (lastToken != token) {
      // TODO: send token to backend here
      await prefs.setString('fcm_token', token);
    }
  }

  Future<void> clearTokenOnLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('fcm_token');

    // TODO: also call backend to remove/invalidate the token here
  }

  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotificationsPlugin.initialize(initSettings);
  }

  Future<void> _showLocalNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'high_importance_channel', // Channel ID
      'High Importance Notifications', // Channel Name
      importance: Importance.max,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotificationsPlugin.show(
      0, // Notification ID
      title,
      body,
      notificationDetails,
    );
  }

  // app is opened and visible on screen
  void _handleForegroundMessage(RemoteMessage message) {
    if (kDebugMode) {
      print("Foreground message received: ${message.notification?.title}");
    }
    _showLocalNotification(
      message.notification?.title ?? "No Title",
      message.notification?.body ?? "No Body",
    );
  }

  // app is opened but not visible on screen
  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    if (kDebugMode) {
      print("Background message received: ${message.messageId}");
    }
  }

  // app is at inactive state and the user opens the app via clicking on a notification
  Future<void> _handleInitialMessage() async {
    try {
      RemoteMessage? initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null) {
        if (kDebugMode) {
          print(
              "App opened from terminated state: ${initialMessage.notification?.title}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error handling initial message: $e");
      }
    }
  }
}
