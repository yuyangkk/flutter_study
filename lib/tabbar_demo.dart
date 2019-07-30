import 'package:flutter/material.dart';

class TabBarPageDemo extends StatefulWidget {
  @override
  _TabBarPageDemoState createState() => _TabBarPageDemoState();
}

class _TabBarPageDemoState extends State<TabBarPageDemo>
    with SingleTickerProviderStateMixin {
  List _tabs = ['奔驰', '宝马', '奥迪'];
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(
        length: _tabs.length,
        vsync: this); // TabBar 和TabBarView 要公用一个controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBarDemo'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: TabBar(
              tabs: _tabs.map((text) => Tab(text: text)).toList(),
              controller: this._controller,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: TabBarView(
                children:
                _tabs.map((text) => Container(child: Text(text + '的内容'))).toList(),
                controller: this._controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
