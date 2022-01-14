import 'views/login_page.dart';
import 'views/admin_page.dart';
import 'views/register_page.dart';
import 'views/admin_artist_page.dart';
import 'views/ajout_artist_page.dart';
import 'package:flutter/material.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Festival',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
          ),
      ),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => const RegisterPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/admin': (BuildContext context) => const AdminPage(),
        '/admin/artist': (BuildContext context) => const AdminArtistPage(),
        '/admin/artist/ajout': (BuildContext context) => const AjoutArtist(),
        '/home': (BuildContext context) => const HomePage(),
      },
      initialRoute: '/home',
    );
  }
}