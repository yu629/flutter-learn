import 'package:flutter/material.dart';
import 'package:frist_flutter_demo/utils/myIcons.dart';

class ImageIconLayout extends StatefulWidget {
  ImageIconLayout({Key key}) : super(key: key);

  @override
  _ImageIcon createState() => _ImageIcon();
}

class _ImageIcon extends State<ImageIconLayout> {
  // 加载图片
  Widget listLayout() {
    return (ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        Image(image: AssetImage("images/avatar.png"), width: 100.0),
        Image.asset(
          "images/avatar.png",
          width: 100.0,
        ),
        Image(
          image: NetworkImage(
              "https://www.zywl8.cn/article/data/images/2020-01-28/3f63df01b1f1af78b27b750c5a0015dd.jpg"),
          width: 100.0,
        ),
        Image.network(
          "https://www.zywl8.cn/article/data/images/2020-01-28/3f63df01b1f1af78b27b750c5a0015dd.jpg",
          width: 100.0,
        ),
        Image(
          image: AssetImage("images/avatar.png"),
          width: 100.0,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
        ),
        Image(
          image: AssetImage("images/avatar.png"),
          width: 100.0,
          height: 200.0,
          repeat: ImageRepeat.repeatY,
        ),
      ],
    ));
  }

  // 图片显示形式
  Widget showFitImage() {
    var img = AssetImage("images/avatar.png");
    return (SingleChildScrollView(
      child: Column(
          children: <Image>[
        Image(
          image: img,
          height: 50.0,
          width: 100.0,
          fit: BoxFit.fill,
        ),
        Image(
          image: img,
          height: 50,
          width: 50.0,
          fit: BoxFit.contain,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitWidth,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitHeight,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.scaleDown,
        ),
        Image(
          image: img,
          height: 50.0,
          width: 100.0,
          fit: BoxFit.none,
        ),
        Image(
          image: img,
          width: 100.0,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
          fit: BoxFit.fill,
        ),
        Image(
          image: img,
          width: 100.0,
          height: 200.0,
          repeat: ImageRepeat.repeatY,
        )
      ].map((e) {
        return Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 100,
                child: e,
              ),
            ),
            Text(e.fit.toString())
          ],
        );
      }).toList()),
    ));
  }

  // 自定义图标
  Widget iconData() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          MyIcons.book,
          color: Colors.purple,
        ),
        Icon(
          MyIcons.wechat,
          color: Colors.green,
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('图片及ICON'),
        ),
        body: this.showFitImage());
  }
}
