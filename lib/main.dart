import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/AuthService/auth_service.dart';
import 'package:restaurant_app/screens/home/item_description.dart';
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
        primaryColor: MainColors.primaryColor,
        scaffoldBackgroundColor: MainColors.primaryColor,
      ),
      home: const SystemUI(),
      routes: {
        ItemDescription.routeName: (BuildContext context) => ItemDescription(),
      },
    );
  }
}

class SystemUI extends StatelessWidget {
  const SystemUI({Key? key}) : super(key: key);

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
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
