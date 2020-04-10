import 'package:flutter/material.dart';

class TextLayout extends StatefulWidget {
  TextLayout({Key key}) : super(key: key);

  @override
  _TextLayout createState() => new _TextLayout();
}

class _TextLayout extends State<TextLayout> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("文本及样式"),
        ),
        body: Column(
          children: <Widget>[
            Text(
              "Hello world",
              textAlign: TextAlign.left,
            ),
            Text(
              "Hello world! I'm Jack. " * 4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world",
              textScaleFactor: 1.5,
            ),
            Text(
              "Hello world " * 6, //字符串重复六次
              textAlign: TextAlign.center,
            ),
            Text(
              "Hello world",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
              ),
            ])),
            Text(
              "Use the font for this text",
              style: TextStyle(
                fontFamily: 'Robot',
              ),
            ),
            DefaultTextStyle(
              //1.设置文本默认样式
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("hello world"),
                  Text("I am Jack"),
                  Text(
                    "I am Jack",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
