import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('お気に入り'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Text('お気に入りのリストがならぶ'),
        ])));
  }
}
