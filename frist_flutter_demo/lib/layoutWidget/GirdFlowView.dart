import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GirdViewLayout extends StatefulWidget {
  GirdViewLayout({Key key}) : super(key: key);

  @override
  _GirdViewLayoutState createState() => _GirdViewLayoutState();
}

class _GirdViewLayoutState extends State<GirdViewLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('瀑布流布局'),
          ),
          body: new StaggeredGridView.countBuilder(
            primary: false,
            crossAxisCount: 4,
            itemCount: 16,
            itemBuilder: (BuildContext context, int index) => new Container(
                color: Colors.green,
                child: new Center(
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text('$index'),
                  ),
                )),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )),
    );
  }
}
