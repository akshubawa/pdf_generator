import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agarwal_packers/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCwNzugYwf96lhUWWgkSg5RDGI-dF5QTF4",
        appId: '1:350508918166:android:3f881bc2d6248942f8a9b7',
        projectId: 'agarwal-packers-94523',
        messagingSenderId: '350508918166'),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
