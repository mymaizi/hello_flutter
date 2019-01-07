import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Job extends StatelessWidget {
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
      appBar: new AppBar(
        title: new Text("工作"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: () {},
          ),
        ],
        elevation: 0.0,
      ),
      body: new Container(
        color: Colors.grey[200],
        child: new ListView(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(0)),
          children: <Widget>[
            buildTileButton("日程", Icons.timer),
            new SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            buildTileButton("新增房源", Icons.remove_red_eye),
            new Divider(height: 0),
            buildTileButton("新增客源", Icons.equalizer),
            new SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            buildTileButton("跟进", Icons.remove_red_eye),
            new Divider(height: 0),
            buildTileButton("带看记录", Icons.equalizer),
          ],
        ),
      ),
    );
  }
}
