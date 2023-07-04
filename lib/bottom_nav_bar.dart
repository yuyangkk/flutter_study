import 'package:flutter/material.dart';

class BottomBarPageDemo extends StatefulWidget {
  @override
  _BottomBarPageDemoState createState() => _BottomBarPageDemoState();
}

class _BottomBarPageDemoState extends State<BottomBarPageDemo> {
  late PageController _controller;
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
      appBar: AppBar(
        title: Text("BottomBarPageDemo"),
      ),
      body: PageView(
        children: <Widget>[
          Container(
            child: Text('home'),
          ),
          Container(
            child: Text('account'),
          )
        ],
        controller: _controller,
        onPageChanged: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home, color: _currentIndex == 0 ? Colors.blue : Colors.black,),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                    _controller.animateToPage(_currentIndex, curve: Curves.ease, duration: Duration(milliseconds: 200));
                  });
                },
              ),
              flex: 1,
            ),
            Expanded(
              child: SizedBox(),
              flex: 1,
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.account_box, color: _currentIndex == 1 ? Colors.blue : Colors.black,),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                    _controller.animateToPage(_currentIndex, curve: Curves.ease, duration: Duration(milliseconds: 200));
                  });
                },
              ),
              flex: 1,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // flatingActionButton 的位置
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('flating button action');
        },
      ),
    );
  }
}
