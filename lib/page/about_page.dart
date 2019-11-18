import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Text('作者 junara'),
          Text('理系のための学会検索サイトです。'),
          Text('jun5araki@gmail.com'),
        ])));
  }
}
