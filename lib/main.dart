import 'package:cari_celah/screen/component/bottom_navigation.dart';
import 'package:cari_celah/screen/home/dashboard.dart';
import 'package:cari_celah/screen/home/pengaturan_alat.dart';
import 'package:cari_celah/screen/home/setelan_page.dart';
import 'package:cari_celah/screen/login/forgot_password.dart';
import 'package:cari_celah/screen/login/landing_page.dart';
import 'package:cari_celah/screen/login/login_page.dart';
import 'package:cari_celah/screen/login/register_page.dart';
import 'package:cari_celah/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cari_celah/firebase_options.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => SplashScreen(),
      },
    );
  }
}
