import 'package:flutter/material.dart';
import 'signature_painter_page.dart';
import 'fade_animation.dart';
import 'http_demo.dart';
import 'isolate_demo.dart';
import 'input_decoration_demo.dart';
import 'tabbar_demo.dart';

void main() => runApp(SampleApp());

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
//      routes: <String, WidgetBuilder>{
//        'fade': (BuildContext context) => FadeAnimationPage(
//              title: 'fade',
//            ),
//        'signature': (BuildContext context) => SignaturePage(
//              title: 'signature'
//            ),
//      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FadeAnimationPage(title: 'FadePage'),
                  ),
                );
              },
              child: Text('Fade_Animation'),
            ),
            SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignaturePage(title: 'SignaturePage'),
                  ),
                );
              },
              child: Text('signature_painter'),
            ),
            SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HttpDemoPage(),
                  ),
                );
              },
              child: Text('http_demo'),
            ),

            SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ISOLateDemoPage(),
                  ),
                );
              },
              child: Text('isolate_demo'),
            ),

            SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputDecorationDemoPage(),
                  ),
                );
              },
              child: Text('InputDecorationDemoPage'),
            ),

            SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabBarPageDemo(),
                  ),
                );
              },
              child: Text('TabBarPageDemo'),
            ),
          ],
        ),
      ),
    );
  }
}
