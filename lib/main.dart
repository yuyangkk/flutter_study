import 'package:flutter/material.dart';
import 'signature_painter_page.dart';
import 'fade_animation.dart';
import 'http_demo.dart';
import 'isolate_demo.dart';
import 'input_decoration_demo.dart';
import 'tabbar_demo.dart';
import 'drawer_demo.dart';
import 'push_response.dart';
import 'bottom_nav_bar.dart';

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
  void _pushNavigatorResponse(BuildContext cxt) async {
    String response = await Navigator.push(
      cxt,
      MaterialPageRoute(
        builder: (cxt) => NavigatorResponsePage(),
      ),
    );

    Scaffold.of(cxt).showSnackBar(
      SnackBar(
        content: Text(response),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FadeAnimationPage(title: 'FadePage'),
                ),
              );
            },
            title: Text('Fade_Animation'),
          ),
          Divider(height: 1.0,),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignaturePage(title: 'SignaturePage'),
                ),
              );
            },
            title: Text('signature_painter'),
          ),
          Divider(height: 1.0,),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HttpDemoPage(),
                ),
              );
            },
            title: Text('http_demo'),
          ),
          Divider(height: 1.0,),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ISOLateDemoPage(),
                ),
              );
            },
            title: Text('isolate_demo'),
          ),
          Divider(height: 1.0,),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputDecorationDemoPage(),
                ),
              );
            },
            title: Text('InputDecorationDemoPage'),
          ),
          Divider(height: 1.0,),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TabBarPageDemo(),
                ),
              );
            },
            title: Text('TabBarPageDemo'),
          ),
          Divider(height: 1.0,),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerPageDemo(),
                ),
              );
            },
            title: Text('DrawerPageDemo'),
          ),
          Divider(height: 1.0,),

          Builder(
            builder: (BuildContext cxt) {
              return ListTile(
                onTap: () {
                  _pushNavigatorResponse(cxt);
                },
                title: Text('NavigatorResponseDemo'),
              );
            },
          ),
          Divider(height: 1.0,),

          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomBarPageDemo(),
                ),
              );
            },
            title: Text('BottomBarPageDemo'),
          ),
          Divider(height: 1.0,),
        ],
      ),
    );
  }
}
