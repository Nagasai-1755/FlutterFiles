import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async{
   print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');

print('payload:${message.data}'); }

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    //final fcToken = await _firebaseMessaging.getToken();
    //print('Token : $fcToken');
    String? token = await FirebaseMessaging.instance.getToken();
    print('Token : $token');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}