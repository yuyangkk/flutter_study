import 'package:flutter/material.dart';

class DrawerPageDemo extends StatefulWidget {
  @override
  _DrawerPageDemoState createState() => _DrawerPageDemoState();
}

class _DrawerPageDemoState extends State<DrawerPageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DrawerPageDemo'),
        leading: Builder(builder: (BuildContext cxt) {
          // 此处需要创建一个内部BuildContext，以便onPressed方法可以使用Scaffold.of（）引用Scaffold。
          // 文档
          return IconButton(icon: Icon(Icons.account_circle), onPressed: (){
            Scaffold.of(cxt).openDrawer();
          });
        }),
      ),
      drawer: Container(
        width: 300.0,
        color: Colors.red,
      ),
      body: Container(
        child: Text('抽屉效果'),
      ),
    );
  }
}

// 或者使用下面的方式调出抽屉效果
//class _DrawerPageDemoState extends State<DrawerPageDemo> {
//
//  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
//  //一个不太优雅但更方便的解决方案是将GlobalKey分配给Scaffold，然后使用key.currentState属性来获取ScaffoldState而不是使用Scaffold.of函数。
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      key: _globalKey,
//      appBar: AppBar(
//        title: Text('DrawerPageDemo'),
//        leading: IconButton(icon: Icon(Icons.account_circle), onPressed: (){
//          _globalKey.currentState.openDrawer();
//        }),
//      ),
//      drawer: Container(
//        width: 300.0,
//        color: Colors.red,
//      ),
//      body: Container(
//        child: Text('抽屉效果'),
//      ),
//    );
//  }
//}

