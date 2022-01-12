import 'package:flutter/material.dart';

class NavigatorResponsePage extends StatefulWidget {
  @override
  _NavigatorResponsePageState createState() => _NavigatorResponsePageState();
}

class _NavigatorResponsePageState extends State<NavigatorResponsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航返回数据'),
      ),
      body: ElevatedButton(
        onPressed: (){
          Navigator.pop(context, '返回的数据');
        },
        child: Text('返回传值'),
      ),
    );
  }
}