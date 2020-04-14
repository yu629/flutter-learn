import 'package:flutter/material.dart';

class ClipLayout extends StatefulWidget {
  ClipLayout({Key key}) : super(key: key);

  @override
  _ClipLayoutState createState() => _ClipLayoutState();
}

class _ClipLayoutState extends State<ClipLayout> {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("images/avatar.png", width: 60.0);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('剪裁（Clip）'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              avatar, //不剪裁
              ClipOval(child: avatar), //剪裁为圆形
              ClipRRect(
                //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                    child: avatar,
                  ),
                  Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRect(
                    //将溢出部分剪裁
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, //宽度设为原来宽度一半
                      child: avatar,
                    ),
                  ),
                  Text("你好世界", style: TextStyle(color: Colors.green))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
