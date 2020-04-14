import 'package:flutter/material.dart';
import 'package:frist_flutter_demo/baseWidget/SwitchAndCheckBoxTestRoute.dart';
import 'package:frist_flutter_demo/baseWidget/TextfiledForm.dart';
import 'package:frist_flutter_demo/baseWidget/button.dart';
import 'package:frist_flutter_demo/baseWidget/imageIcon.dart';
import 'package:frist_flutter_demo/baseWidget/stateManager.dart';
import 'package:frist_flutter_demo/baseWidget/text.dart';
import 'package:frist_flutter_demo/baseWidget/widget.dart';
import 'package:frist_flutter_demo/layoutWidget/Align.dart';
import 'package:frist_flutter_demo/layoutWidget/Canvas.dart';
import 'package:frist_flutter_demo/layoutWidget/Clip.dart';
import 'package:frist_flutter_demo/layoutWidget/Constrained.dart';
import 'package:frist_flutter_demo/layoutWidget/Container.dart';
import 'package:frist_flutter_demo/layoutWidget/CustomScrollView.dart';
import 'package:frist_flutter_demo/layoutWidget/DecoratedBox.dart';
import 'package:frist_flutter_demo/layoutWidget/Flex.dart';
import 'package:frist_flutter_demo/layoutWidget/GirdFlowView.dart';
import 'package:frist_flutter_demo/layoutWidget/Hero.dart';
import 'package:frist_flutter_demo/layoutWidget/ListView.dart';
import 'package:frist_flutter_demo/layoutWidget/Padding.dart';
import 'package:frist_flutter_demo/layoutWidget/RowColum.dart';
import 'package:frist_flutter_demo/layoutWidget/ScrollListion.dart';
import 'package:frist_flutter_demo/layoutWidget/Stack.dart';
import 'package:frist_flutter_demo/layoutWidget/Transform.dart';
import 'package:frist_flutter_demo/layoutWidget/Wrap.dart';
import 'package:frist_flutter_demo/myDrawer.dart';

import 'package:frist_flutter_demo/route/echoRoute.dart';
import 'package:frist_flutter_demo/route/newRoute.dart';
import 'package:frist_flutter_demo/route/routeDemo.dart';
import 'package:frist_flutter_demo/route/tipRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            print(routeName);
            if (routeName == 'WidgetLayout') {
              return WidgetLayout();
            } else if (routeName == 'ImageIcon') {
              return ImageIconLayout();
            }
            return NewRoute();
            // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
            // 引导用户登录；其它情况则正常打开路由。
          });
        },
        //注册路由表
        routes: {
          "CanvasLayout": (context) => CanvasLayout(),
          "HeroLayout": (context) => HeroLayout(),
          "ScrollLayout": (context) => ScrollLayout(),
          "CustomLayout": (context) => CustomLayout(),
          "GirdViewLayout": (context) => GirdViewLayout(),
          "ListViewLayout": (context) => ListViewLayout(),
          "ClipLayout": (context) => ClipLayout(),
          "ContainerLayout": (context) => ContainerLayout(),
          "TransformLayout": (context) => TransformLayout(),
          "DecoratedBoxLayout": (context) => DecoratedBoxLayout(),
          "Constrained": (context) => Constrained(),
          "PaddingLayout": (context) => PaddingLayout(),
          "AlignLayout": (context) => AlignLayout(),
          "StackLayout": (context) => StackLayout(),
          "WrapLayout": (context) => WrapLayout(),
          "FlexLayout": (context) => FlexLayout(),
          "RowColum": (context) => RowColum(),
          "TextfiledForm": (context) => TextfiledForm(),
          "SwitchAndCheckBoxTestRoute": (context) =>
              SwitchAndCheckBoxTestRoute(),
          "ButtonLayout": (context) => ButtonLayout(),
          "TextLayout": (context) => TextLayout(),
          "StateManager": (context) => StateManager(),
          "RouteDemo": (context) => RouteDemo(),
          "Echo": (context) => EchoRoute(),
          "tip2": (context) {
            return TipRoute(
              text: ModalRoute.of(context).settings.arguments,
              name: '',
            );
          },
          "/": (context) =>
              MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
        }
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  List<Widget> _dataMap = [];

  static GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    //初始化状态
    _retrieveIcons();
    print("initState");
  }

  void _onTap(navigateName) {
    //全局打开抽屉方法
    // _globalKey.currentState.openDrawer();

    //定义点击函数
    Navigator.pushNamed(context, navigateName);
  }

  Widget containerItem(navigateName, title) {
    return (GestureDetector(
      onTap: () => _onTap(navigateName), // 分析 1
      child: Container(
        child: Center(
          child: Text(title,
              textAlign: TextAlign.center, // 分析 2
              style: TextStyle(fontSize: 10.0, color: Colors.white)),
        ),
        decoration: BoxDecoration(
          color: Colors.lightGreen[700],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    //定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
    return Scaffold(
      key: _globalKey, //设置key
      appBar: AppBar(
        //导航栏
        title: Text("Flutter Demo"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: new MyDrawer(), //抽屉
      // bottomNavigationBar: BottomNavigationBar(
      //   // 底部导航
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.business), title: Text('资讯')),
      //     BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我的')),
      //   ],
      //   currentIndex: _selectedIndex,
      //   fixedColor: Colors.blue,
      //   onTap: _onItemTapped,
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business), onPressed: () {}),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      ),
      body: GridView.builder(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //每行三列
            childAspectRatio: 3.0, //显示区域宽高相等
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: _dataMap.length,
          itemBuilder: (context, index) {
            //如果显示到最后一个并且Icon总数小于200时继续获取数据
            // if (index == _dataMap.length - 1 && _dataMap.length < 200) {
            //   _retrieveIcons();
            // }
            return _dataMap[index];
          }),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: () {}),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _dataMap.addAll([
          containerItem('RouteDemo', "路由管理"),
          containerItem('WidgetLayout', "生命周期"),
          containerItem('StateManager', "状态管理"),
          containerItem('TextLayout', "文本及样式"),
          containerItem('ButtonLayout', "按钮"),
          containerItem('ImageIcon', " 图片及ICON"),
          containerItem('SwitchAndCheckBoxTestRoute', "开关复选框进度条"),
          containerItem('TextfiledForm', "输入框及表单"),
          containerItem('RowColum', "线性布局Row，Colum"),
          containerItem('FlexLayout', "弹性布局（Flex）"),
          containerItem('WrapLayout', "流式布局"),
          containerItem('StackLayout', "层叠布局"),
          containerItem('AlignLayout', '对齐与相对定位'),
          containerItem('PaddingLayout', '填充（Padding）'),
          containerItem('Constrained', '尺寸限制类容器'),
          containerItem('DecoratedBoxLayout', '装饰容器DecoratedBox'),
          containerItem('TransformLayout', '变换（Transform）'),
          containerItem('ContainerLayout', 'Container容器'),
          containerItem('ClipLayout', '剪裁（Clip）'),
          containerItem('ListViewLayout', 'ListView'),
          containerItem('GirdViewLayout', 'GridView'),
          containerItem('CustomLayout', 'CustomScrollView'),
          containerItem('ScrollLayout', '滑动监听'),
          containerItem('HeroLayout', 'Hero动画'),
          containerItem("CanvasLayout", '自绘组件')
        ]);
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
