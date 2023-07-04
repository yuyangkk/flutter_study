import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:isolate';

class ISOLateDemoPage extends StatefulWidget {
  @override
  _ISOLateDemoPageState createState() => _ISOLateDemoPageState();
}

class _ISOLateDemoPageState extends State<ISOLateDemoPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();

    loadData();
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  ListView getListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return getRow(index);
      },
      itemCount: widgets.length,
    );
  }

  getRow(int index) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Row ${widgets[index]['title']}'),
    );
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  loadData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    // The 'echo' isolate sends its SendPort as the first message
    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(
        sendPort, 'https://jsonplaceholder.typicode.com/posts');

    setState(() {
      widgets = msg;
    });
  }

  //the entry point for the isolate
  static dataLoader(SendPort sendPort) async {
    // Open the ReceivePort for incoming messages.
    ReceivePort port = ReceivePort();

    // Notify any other isolates what port this isolate listens to.
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataUrl = data;
      http.Response response = await http.get(Uri.parse(dataUrl));
      // Lots of JSON to parse
      replyTo.send(json.decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ISOLate'),
      ),
      body: getBody(),
    );
  }
}
