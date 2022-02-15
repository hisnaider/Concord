import 'package:concord/Aplicativo/App.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future<void> _firebaseNotificBackgroundHandler(RemoteMessage mensagem) async{
  print('Handling a background message ${mensagem.messageId} +++++++++++++++++++++++++++++++++++++++');
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "Concord",
    options: FirebaseOptions(
      apiKey: "AIzaSyAKP7KiIoTgMoExI0MHhlFnRlSlgyzJ5lU", 
      appId: "1:989358822026:android:edfbabb22a7b2c471dd373", 
      messagingSenderId: "989358822026", 
      projectId: "teste-2e7fb"
    )
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseNotificBackgroundHandler);
  if(!kIsWeb){
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      "canalImportante", 
      "Notificação importante",
      description: "Esse canal é pra notificações importantes"
    );
    FlutterLocalNotificationsPlugin pluginDeNotificLocal = FlutterLocalNotificationsPlugin();

    await pluginDeNotificLocal.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  
  
  runApp(App());
}
