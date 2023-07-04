import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpDemoPage extends StatefulWidget {
  @override
  _HttpDemoPageState createState() => _HttpDemoPageState();
}

class _HttpDemoPageState extends State<HttpDemoPage> {
  List _widgets = [];

  void _loadData() async {
    String dataUrl = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Uri.parse(dataUrl));
    setState(() {
      _widgets = json.decode(response.body);
    });
  }

  Widget _getRow(int index) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          Text('Row ${_widgets[index]["title"]}'),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http demo'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _getRow(index);
        },
        itemCount: _widgets.length,
      ),
    );
  }
}
