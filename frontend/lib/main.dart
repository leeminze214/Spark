import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

ThemeData mainTheme = ThemeData(
  primarySwatch: Colors.amber,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '+Talk',
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      home: Home(title: 'Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      body: Center(

      ),
    );
  }
}
