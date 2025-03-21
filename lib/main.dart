import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:spytifo/firebase_options.dart';
import 'package:spytifo/presentations/screens/signin.dart';
import 'package:spytifo/presentations/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SigninPage(),
      ),
    );
  }
}
