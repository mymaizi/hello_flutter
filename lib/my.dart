import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class My extends StatelessWidget {
  Widget buildTileButton(String text, IconData icon) {
    return new Container(
        color: Colors.white,
        child: new SizedBox(
            height: ScreenUtil().setHeight(110),
            child: new Center(
                child: new ListTile(
              leading: new Icon(icon, size: ScreenUtil().setSp(60)),
              title: new Text(text),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
      children: <Widget>[
        new Container(
            color: Colors.blue,
            height: ScreenUtil().setHeight(300),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: ScreenUtil.statusBarHeight,
                  width: ScreenUtil.screenWidthDp,
                  child: new ListTile(
                      leading: new ClipOval(
                        child: new Image.asset(
                          "images/app.png",
                          width: ScreenUtil().setWidth(150),
                        ),
                      ),
                      title: new Text("此处显示姓名"),
                      subtitle: new Text("此处显示岗位名称"),
                      trailing: new Icon(Icons.camera)),
                )
              ],
            )),
        new Expanded(
            child: new Container(
          color: Colors.grey[200],
          child: new ListView(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            children: <Widget>[
              buildTileButton("签到", Icons.timer),
              new SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              buildTileButton("日志", Icons.remove_red_eye),
              new Divider(height: 0),
              buildTileButton("我的业绩", Icons.equalizer),
              new SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              buildTileButton("设置", Icons.settings),
            ],
          ),
        ))
      ],
    ));
  }
}
