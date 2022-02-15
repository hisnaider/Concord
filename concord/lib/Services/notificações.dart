import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Notif{
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ///late StreamSubscription iosSubscription;

  Future<void> salvarToken() async{
    String? token = await _fcm.getToken();
    await FirebaseFirestore.instance.collection("Usuarios").doc(_auth.currentUser!.uid).collection("Tokens").doc(token).set({
      "data": FieldValue.serverTimestamp(),
      "dispositivo": Platform.operatingSystem,
      "Token": token
    });
  }
}