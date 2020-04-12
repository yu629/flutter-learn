import 'package:flutter/material.dart';

class AlignLayout extends StatefulWidget {
  AlignLayout({Key key}) : super(key: key);

  @override
  _AlignLayout createState() => _AlignLayout();
}

class _AlignLayout extends State<AlignLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('对齐与相对定位（Align）'),
        ),
        body: Container(
          // height: 120.0,
          // width: 120.0,
          color: Colors.blue[50],
          child: Align(
            widthFactor: 3,
            heightFactor: 3,
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}
