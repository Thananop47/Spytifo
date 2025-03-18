import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spytifo/firebase_options.dart';
import 'package:spytifo/presentations/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
