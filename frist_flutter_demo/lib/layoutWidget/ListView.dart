import 'package:flutter/material.dart';

class ListViewLayout extends StatefulWidget {
  ListViewLayout({Key key}) : super(key: key);

  @override
  _ListViewLayoutState createState() => _ListViewLayoutState();
}

class _ListViewLayoutState extends State<ListViewLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: Column(children: <Widget>[
          ListTile(title: Text("商品列表")),
          Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            }),
          ),
        ]),
      ),
    );
  }
}
