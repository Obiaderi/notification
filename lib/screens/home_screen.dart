import 'package:flutter/material.dart';
import 'package:flutter_local_notification/local_notifications.dart';

import 'anaother_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _listenToNofications();
    super.initState();
  }

  _listenToNofications() {
    print('listening to notifications');
    LocalNotification.onClickNotification.stream.listen((payload) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnotherScreen(payload: payload)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Local Notifications'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  LocalNotification.showNotification(
                    title: 'Simple Notification',
                    body: 'Simple body',
                    payload: 'Simple Payload',
                  );
                },
                icon: const Icon(Icons.notifications),
                label: const Text('Simple Notification'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  LocalNotification.showPeriodicNotification(
                    title: 'Periodic Notification',
                    body: 'Periodic body',
                    payload: 'Periodic Payload',
                  );
                },
                icon: const Icon(Icons.timer_outlined),
                label: const Text('Periodic Notification'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  LocalNotification.scheduleNotification(
                    title: 'Schedule Notification',
                    body: 'Schedule body',
                    payload: 'Schedule Payload',
                  );
                },
                icon: const Icon(Icons.timer_outlined),
                label: const Text('Schedule Notification'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  LocalNotification.cancelNotification(1);
                },
                icon: const Icon(Icons.cancel),
                label: const Text('Cancel Periodic Notification'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  LocalNotification.cancelAllNotifications();
                },
                icon: const Icon(Icons.cancel),
                label: const Text('Cancel All Notification'),
              ),
            ],
          ),
        ));
  }
}
