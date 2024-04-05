import 'package:flutter/material.dart';
import 'package:front/core/const/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationTokenScreen extends StatefulWidget {
  const NotificationTokenScreen({super.key});

  @override
  State<NotificationTokenScreen> createState() =>
      _NotificationTokenScreenState();
}

class _NotificationTokenScreenState extends State<NotificationTokenScreen> {
  late String notificationToken;
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: sharedPreferences,
          builder: (context, snapshot) {
            notificationToken = snapshot.data?.getString(NOTIFICATION_TOKEN) ??
                'error token not generated';
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: SelectableText(notificationToken),
            );
          },
        ),
      ),
    );
  }
}
