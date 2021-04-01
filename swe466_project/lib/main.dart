import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'locator.dart';
import 'router.dart' as router;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      initialRoute: "/",
    );
  }
}




