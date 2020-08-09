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
    return Scaffold(
      body: Center(
        child: RecordButton(),
      ),
    );
  }
}

class RecordButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage(
                  "https://media.discordapp.net/attachments/739289375883526144/742073225546301620/d2e2643097584e8f4a5421ca429b42b75dd55b91.png?width=936&height=702"),
              width: 200,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: 
              RaisedButton(
                onPressed: () => {},
                color: Colors.grey,
                child: Icon(
                  Icons.mic,
                  color: Colors.white,
                  size: 50,
                ),
                shape: CircleBorder(),
              ),
            ),
          ],
        ),
    ));
  }
}
