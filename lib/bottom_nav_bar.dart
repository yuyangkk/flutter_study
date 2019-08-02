import 'package:flutter/material.dart';
import 'drawer_demo.dart';
import 'signature_painter_page.dart';

class BottomBarPageDemo extends StatefulWidget {
  @override
  _BottomBarPageDemoState createState() => _BottomBarPageDemoState();
}

class _BottomBarPageDemoState extends State<BottomBarPageDemo> {

  PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          DrawerPageDemo(),
          SignaturePage(),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: (){},),
            IconButton(icon: Icon(Icons.account_box), onPressed: (){},)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // flatingActionButton 的位置
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('flating button action');
        },
      ),
    );
  }
}
