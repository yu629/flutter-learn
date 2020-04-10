import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
    this.name,  // 接收一个text参数
  }) : super(key: key);
  final String text;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              Text(name),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}