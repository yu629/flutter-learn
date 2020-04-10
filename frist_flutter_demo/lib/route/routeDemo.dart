import 'package:flutter/material.dart';

class RouteDemo extends StatefulWidget {
  RouteDemo({Key key}) : super(key: key);
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RouteDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('路由介绍'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("跳转"),
                textColor: Colors.blue,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return NewRoute();
                  // }));
                  Navigator.pushNamed(context, "NewRoute");
                },
              ),
              // 路由跳转
              FlatButton(
                child: Text("跳转带参数, 无回调"),
                textColor: Colors.blue,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return NewRoute();
                  // }));
                  // Navigator.pushNamed(context, "Echo");
                  Navigator.of(context).pushNamed("Echo", arguments: "h1");
                },
              ),
              RaisedButton(
                onPressed: () async {
                  // 打开`TipRoute`，并等待返回结果
                  // var result = await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return TipRoute(
                  //         // 路由参数
                  //         text: "我是提示张小帅",
                  //         name: "hahahh",
                  //       );
                  //     },
                  //   ),
                  // );
                  var result = await Navigator.of(context)
                      .pushNamed("tip2", arguments: "hi");
                  //输出`TipRoute`路由返回结果
                  print("路由返回值: $result");
                },
                child: Text("传值且回调"),
              ),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
