import 'package:flutter/material.dart';
import 'package:flutter_study/hv_scrollview.dart';
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

    ScaffoldMessenger.of(cxt).showSnackBar(
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
      body: Wrap(
        spacing: 5,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FadeAnimationPage(title: 'FadePage'),
              ),
            );
          }, child: Text('Fade_Animation'),),
          
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignaturePage(title: 'SignaturePage'),
              ),
            );
          }, child: Text('signature_painter')),
          
          ElevatedButton(
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

          ElevatedButton(
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

          ElevatedButton(
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

          ElevatedButton(
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

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerPageDemo(),
                ),
              );
            },
            child: Text('DrawerPageDemo'),
          ),

          Builder(
            builder: (BuildContext cxt) {
              return ElevatedButton(
                onPressed: () {
                  _pushNavigatorResponse(cxt);
                },
                child: Text('NavigatorResponseDemo'),
              );
            },
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomBarPageDemo(),
                ),
              );
            },
            child: Text('BottomBarPageDemo'),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HorizontalVerticalScrollView(),
                ),
              );
            },
            child: Text('仿支付宝自选列表demo'),
          ),
        ],
      ),
    );
  }
}
