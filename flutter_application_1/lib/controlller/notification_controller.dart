  //import 'package:flutter_native_timezone/flutter_native_timezone.dart';
  import 'package:flutter_timezone/flutter_timezone.dart';
  import 'package:timezone/timezone.dart' as tz;
  import 'package:flutter_local_notifications/flutter_local_notifications.dart';
  import 'package:timezone/data/latest_all.dart' as tz;

  class CustomNotification{
    final int id;
    final String? title;
    final String? body;
    final String payload;

    CustomNotification({
      required this.id,
      required this.title,
      required this.body,
      required this.payload,
    });
  }

  class NotificationController {
    late FlutterLocalNotificationsPlugin localNotificationsPlugin;
    late AndroidNotificationDetails androidNotificationDetails;

    static final NotificationController _instance = NotificationController._internal();

    factory NotificationController(){
      return _instance;
    }

    NotificationController._internal(){
      localNotificationsPlugin=FlutterLocalNotificationsPlugin();
    }
    /*NotificationController () {
      localNotificationsPlugin = FlutterLocalNotificationsPlugin();
      
    }*/

    Future <void> setupNotifications() async{
      await _setupTimezone();
      await _initializeNotifications();
    }

    Future<void> _setupTimezone() async{
      tz.initializeTimeZones();
      final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName!));
    }

   /* _initializeNotifications() async{
      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      await localNotificationsPlugin.initialize(
        const InitializationSettings(
          android: android,

        ),
    //    onSelectNotification: _onSelectedNotification,
      );

      /*_onSelectedNotification(String? payload){
        if (payload != null && payload.isNotEmpty){
          Navigator.of(Routes.navigatorKey!.currentContext).pushReplacementNamed(payload);
        }
      }*/
    }  */

  Future<void> _initializeNotifications() async {
  const android = AndroidInitializationSettings('@mipmap/ic_launcher');

  await localNotificationsPlugin.initialize(
    const InitializationSettings(
      android: android,
    ),
  );

  // ✅ CRIAÇÃO DO CANAL (necessário no Android 8+)
  const androidChannel = AndroidNotificationChannel(
    'notificacao_padrao',
    'lembretes',
    description: 'Este canal é para lembretes',
    importance: Importance.max,
  );

  final androidImplementation = localNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

  await androidImplementation?.createNotificationChannel(androidChannel);
}


    showNotification(CustomNotification notification){
      androidNotificationDetails = const AndroidNotificationDetails(
        'notificacao_padrao',
        'lembretes',
        channelDescription: 'Este canal é para lembretes',
        importance: Importance.max,
        priority: Priority.max,
        enableVibration: true,
      );
      localNotificationsPlugin.show(
        notification.id,
        notification.title,
        notification.body,
        NotificationDetails(
          android: androidNotificationDetails,
        ),
        payload: notification.payload,
      );
    }

    showNotificationFuture(CustomNotification notification){
      final date = DateTime.now().add(const Duration(seconds: 5));
      androidNotificationDetails = const AndroidNotificationDetails(
        'notificacao_padrao',
        'lembretes',
        channelDescription: 'Este canal é para lembretes',
        importance: Importance.max,
        priority: Priority.max,
        enableVibration: true,
      );
      /*print('Timezones: ${tz.local.name}');
      final scheduleDate =  tz.TZDateTime.from(date, tz.local);
      print('Scheduled notification for: $scheduleDate');
      */
      localNotificationsPlugin.zonedSchedule(
      notification.id,
      notification.title,
      notification.body,
      tz.TZDateTime.from(date, tz.local),
      NotificationDetails(
        android: androidNotificationDetails,
      ),
      payload: notification.payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
    }

  
    checkForNotifications() async{
      final details = await localNotificationsPlugin.getNotificationAppLaunchDetails();
      if (details != null && details.didNotificationLaunchApp){
        //_onSelectedNotifications(details.payload);
      }
    }

  }