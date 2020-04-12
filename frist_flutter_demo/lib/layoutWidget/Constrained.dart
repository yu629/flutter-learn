import 'package:flutter/material.dart';

class Constrained extends StatefulWidget {
  Constrained({Key key}) : super(key: key);

  @override
  _Constrained createState() => _Constrained();
}

class _Constrained extends State<Constrained> {
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('尺寸限制类容器'), actions: <Widget>[
        UnconstrainedBox(
          child: SizedBox(
            width: 30,
            height: 20,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              )
            ),
          ),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('ConstrainedBox限制容器'),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50.0 //最小高度为50像素
                  ),
              child: Container(height: 5.0, child: redBox),
            ),
            Text('SizeBox限制容器'),
            SizedBox(width: 80.0, height: 80.0, child: redBox),
            Text('多重限制容器'),
            ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                  child: redBox,
                )),
            Text('去除限制容器'),
            ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
                child: UnconstrainedBox(
                  //“去除”父级限制
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                    child: redBox,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
