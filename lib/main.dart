import 'view/login_page.dart';
import 'view/admin_page.dart';
import 'view/register_page.dart';
import 'view/admin_artist_page.dart';
import 'view/ajout_artist_page.dart';
import 'package:flutter/material.dart';

import 'view/home_page.dart';

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
      ),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => const RegisterPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/admin': (BuildContext context) => const AdminPage(),
        '/admin/artist': (BuildContext context) => const AdminArtistPage(),
        '/admin/artist/ajout': (BuildContext context) => const AjoutArtist(),
        '/home': (BuildContext context) => const HomePage(),
      },
      initialRoute: '/admin',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
