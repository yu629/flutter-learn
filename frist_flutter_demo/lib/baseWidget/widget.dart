import 'package:flutter/material.dart';

class WidgetLayout extends StatefulWidget {
  WidgetLayout({Key key, this.initValue: 0}) : super(key: key);

  final int initValue;
  @override
  _WidgetLayoutState createState() => _WidgetLayoutState();
}

class _WidgetLayoutState extends State<WidgetLayout> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  void didUpdateWidget(WidgetLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("生命周期"),
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: FlatButton(
            child: Text('$_counter' + "生命周期"),
            //点击后计数器自增
            onPressed: () {
              // ScaffoldState _state =
              //     context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
              // //调用ScaffoldState的showSnackBar来弹出SnackBar
              // _state.showSnackBar(
              //   SnackBar(
              //     content: Text("我是SnackBar"),
              //   ),
              // );
            },
          )),
          Image.asset('images/life.png')
        ],
      ),
    );
  }
}
