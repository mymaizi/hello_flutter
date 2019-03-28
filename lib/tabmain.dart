import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_flutter/home.dart';
import 'package:hello_flutter/job.dart';
import 'package:hello_flutter/my.dart';
import 'package:hello_flutter/book.dart';
class TabMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new TabChange(),
    );
  }
}

class TabChange extends StatefulWidget {
  @override
  createState() {
    return new TabChangeState();
  }
}

class TabChangeState extends State<TabChange> {
  
  int tabIndex = 0;
  var appBarTitles = ['首页', '通讯录', '工作', '我的'];
  var tabBodys = [
    new Home(),
    new Book(),
    new Job(),
    new My(),
  ];
  var tabImages;
  void initData() {
    tabImages = [
      [
        getImage('images/ic_home_normal.png'),
        getImage('images/ic_home_press.png')
      ],
      [
        getImage('images/ic_book_normal.png'),
        getImage('images/ic_book_press.png')
      ],
      [
        getImage('images/ic_job_normal.png'),
        getImage('images/ic_job_press.png')
      ],
      [getImage('images/ic_my_normal.png'), getImage('images/ic_my_press.png')]
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      body: tabBodys[tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(icon: getIcon(0), title: getTitle(0)),
          new BottomNavigationBarItem(icon: getIcon(1), title: getTitle(1)),
          new BottomNavigationBarItem(icon: getIcon(2), title: getTitle(2)),
          new BottomNavigationBarItem(icon: getIcon(3), title: getTitle(3))
        ],
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Image getImage(String path) {
    return new Image.asset(path, width: ScreenUtil().setWidth(50), height: ScreenUtil().setHeight(50));
  }

  Image getIcon(int index) {
    if (index == tabIndex) {
      return tabImages[index][1];
    }
    return tabImages[index][0];
  }

  Text getTitle(int index) {
    if (index == tabIndex) {
      return new Text(appBarTitles[index],
          style: new TextStyle(color: Colors.blue));
    } else {
      return new Text(appBarTitles[index],
          style: new TextStyle(color: Colors.grey));
    }
  }
}
