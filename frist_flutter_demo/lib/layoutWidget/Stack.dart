import 'package:flutter/material.dart';

class StackLayout extends StatefulWidget {
  StackLayout({Key key}) : super(key: key);

  @override
  _StackLayout createState() => _StackLayout();
}

class _StackLayout extends State<StackLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('层叠布局 Stack、Positioned'),
        ),
        body: //通过ConstrainedBox来确保Stack占满屏幕
            ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            // fit: StackFit.expand,
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
