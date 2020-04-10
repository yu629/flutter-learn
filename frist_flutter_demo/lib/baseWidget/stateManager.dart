import 'package:flutter/material.dart';
import 'package:frist_flutter_demo/baseWidget/tapboxB.dart';
import 'package:frist_flutter_demo/baseWidget/tapboxC.dart';
// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class StateManager extends StatefulWidget {
  StateManager({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<StateManager> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("状态管理"),
        ),
        body: Column(
          children: <Widget>[
             new Text('组件自身状态管理'),
            new GestureDetector(
              onTap: _handleTap,
              child: new Container(
                child: new Center(
                  child: new Text(
                    _active ? 'Active' : 'Inactive',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                  color: _active ? Colors.lightGreen[700] : Colors.grey[600],
                ),
              ),
            ),
            new Text('父组件状态管理'),
            new Container(
                child: new TapboxB(
              active: _active,
              onChanged: _handleTapboxChanged,
            )),
            new Text('混合状态管理'),
            new Container(
                child: new TapboxC(
              active: _active,
              onChanged: _handleTapboxChanged,
            )),
            new Text('全局状态管理待补充。。。'),
          ],
        ));
  }
}
