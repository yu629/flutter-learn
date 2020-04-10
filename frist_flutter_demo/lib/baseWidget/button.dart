import 'package:flutter/material.dart';

class ButtonLayout extends StatefulWidget {
  ButtonLayout({Key key}) : super(key: key);

  @override
  _ButtonLayout createState() => _ButtonLayout();
}

class _ButtonLayout extends State<ButtonLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("FlatButton"),
            onPressed: () {},
          ),
          OutlineButton(
            child: Text("OutlineButton"),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {},
          ),
          RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text("发送"),
            onPressed: () {},
          ),
          OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("添加"),
            onPressed: () {},
          ),
          FlatButton.icon(
            icon: Icon(Icons.info),
            label: Text("详情"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
