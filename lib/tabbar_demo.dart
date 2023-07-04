import 'package:flutter/material.dart';

class TabBarPageDemo extends StatefulWidget {
  @override
  _TabBarPageDemoState createState() => _TabBarPageDemoState();
}

class _TabBarPageDemoState extends State<TabBarPageDemo>
    with SingleTickerProviderStateMixin {
  List _tabs = ['奔驰', '宝马', '奥迪'];
  late TabController _controller; // 想要实现Tabbar和TabBarView联动，需要让两个widget使用同一个TabController

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
        // elevation: 0, // 导航底部阴影
        bottom: TabBar(
          tabs: _tabs.map((text) => Tab(text: text)).toList(),
          controller: this._controller,
        ),
      ),
      body: TabBarView(
        children:
            _tabs.map((text) => Container(child: Center(child:Text(text + '的内容', textScaleFactor: 3,)))).toList(),
        controller: this._controller,
      ),
    );
  }
}
