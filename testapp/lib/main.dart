import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: {},
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final On_API_call =
      "https://nyzpe0u2oc.execute-api.us-east-1.amazonaws.com/Test2";
  final Off_API_call =
      "https://6cn4c9wzgi.execute-api.us-east-1.amazonaws.com/Test";
  // gives our app awareness about whether we are succesfully connected to the cloud
  bool _amplifyConfigured = false;

  // Instantiate Amplify
  //Amplify amplifyInstance = Amplify();

  @override
  void initState() {
    super.initState();

    // amplify is configured on startup
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;

    try {
      //await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Test App'),
            ),
            body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
              new Container(
                child: new Column(
                  children: <Widget>[
                    new RaisedButton(
                      color: Colors.blue,
                      child: new Text("ON"),
                      onPressed: () {
                        http.get(this.On_API_call);
                        print("On is clicked");
                      },
                    ),
                    new RaisedButton(
                      color: Colors.blue,
                      child: new Text("OFF"),
                      onPressed: () {
                        http.get(this.Off_API_call);
                        print("OFF is clicked");
                      },
                    ),
                  ],
                ),
              ),
            ])));
  }
}
