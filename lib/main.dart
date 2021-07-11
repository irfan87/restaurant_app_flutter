import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/AuthService/auth_service.dart';
import 'package:restaurant_app/screens/widget_tree.dart';
import 'package:restaurant_app/settings/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Restaurant App",
      theme: ThemeData(
        primarySwatch: MainColors.primaryColor,
        scaffoldBackgroundColor: Color.fromRGBO(200, 200, 200, 1),
      ),
      home: SystemUI(),
    );
  }
}

class SystemUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: MainColors.primaryColor,
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: WidgetTree(
        authAction: AuthService(),
      ),
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: MainColors.primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }
}
