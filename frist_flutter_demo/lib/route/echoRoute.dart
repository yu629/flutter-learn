import 'package:flutter/material.dart';

class EchoRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    //...省略无关代码
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(args),
            ],
          ),
        ),
      ),
    );
  }
}