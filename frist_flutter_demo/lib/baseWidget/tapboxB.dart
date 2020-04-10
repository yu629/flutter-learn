import 'package:flutter/material.dart';
//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
          onTap: _handleTap,
          child: new Container(
            child: new Center(
              child: new Text(
                active ? 'yes' : 'no',
                style: new TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
              color: active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
          ),
        );
  }
}
