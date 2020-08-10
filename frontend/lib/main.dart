import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:http/http.dart' as http;

ThemeData mainTheme = ThemeData(
  primarySwatch: Colors.amber,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

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
  final textControl = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage(
                "https://cdn.discordapp.com/attachments/739289375883526144/742164033528135811/MainPage.png"),
              width: 200,
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                autocorrect: true,
                controller: textControl,
                onSubmitted: (text) {
                  var response = await http.post("localhost:5000/upload-text", {"data": "i hate myself"})
                  print(text);
                },
              ),
            ),
          SizedBox(width: 100, height: 100, child: RecordButton()),
        ],
      ),
    ));
  }
}

class RecordButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RecordButtonState();
}

class RecordButtonState extends State<RecordButton> {
  SpeechRecognition sr;
  bool available = false;
  bool listening = false;

  String interpretedText = "";

  void initState() {
    super.initState();
  }

  void initSpeechRecognizer() {
    sr = SpeechRecognition();

    sr.setAvailabilityHandler((bool result) {
      setState(() {
        available = result;
      });
    });

    sr.setRecognitionStartedHandler(() => setState(() => listening = true));

    sr.setRecognitionResultHandler(
        (String text) => setState(() => interpretedText = text));

    sr.setRecognitionCompleteHandler(() => setState(() => listening = false));

    sr.activate().then((result) => setState(() => available = result));
  }

  @override
  Widget build(BuildContext context) {
    print("hi");
    return RaisedButton(
      onPressed: () {
        print("$listening");
        if (!listening) {
          // record
          setState(() {
            listening = true;
          });
          sr.listen(locale: "en_US").then((result) => print("$result"));
        } else if (listening) {
          // stop
          print("stopping recording");
          sr.stop().then((result) => setState(() => listening = false));
        }
      },
      color: listening ? Colors.red : Colors.grey,
      child: Icon(
        Icons.mic,
        color: Colors.white,
        size: 50,
      ),
      shape: CircleBorder(),
    );
  }
}
