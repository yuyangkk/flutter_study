import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:isolate';

class InputDecorationDemoPage extends StatefulWidget {
  @override
  _InputDecorationDemoPageState createState() =>
      _InputDecorationDemoPageState();
}

class _InputDecorationDemoPageState extends State<InputDecorationDemoPage> {
  String? _errorText;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InputDecoration'),
      ),
      body: Center(
        child: TextField(
          onSubmitted: (String text) {
            setState(() {
              if (isEmail(text)) {
                _errorText = null;
              } else {
                _errorText = 'Error:This is not an email';
              }
            });
          },
          decoration: InputDecoration(
            hintText: 'this is a hint',
            errorText: _errorText,
          ),
        ),
      ),
    );
  }

  bool isEmail(String text) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailRegexp);
    return regExp.hasMatch(text);
  }
}
