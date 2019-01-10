import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_world/houses.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Colors.white;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color, size: ScreenUtil().setSp(60)),
          new Container(
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buildWidgetColumn(Color color, IconData icon, String label) {
      return GestureDetector(
        child: Container(
          height: ScreenUtil().setHeight(300),
          width: ScreenUtil().setWidth(230),
          child: buildButtonColumn(icon, label),
          decoration: new BoxDecoration(
            color: color,
            borderRadius: new BorderRadius.all(
              const Radius.circular(8.0),
            ),
          ),
          padding: new EdgeInsets.all(16.0),
        ),
        onTap: () {
          Widget path = Houses(
            title: label,
          );
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => path));
        },
      );
    }

    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Image.asset("images/appbg.jpg",
                  fit: BoxFit.fill, height: ScreenUtil().setHeight(460)),
              new Positioned(
                child: new Image.asset("images/logo.png",
                    height: ScreenUtil().setHeight(70)),
                bottom: 2,
                right: 2,
              )
            ],
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Center(
                  child: new Column(
                    children: <Widget>[new Text("今日积分"), new Text("0")],
                  ),
                ),
                new Center(
                  child: new Column(
                    children: <Widget>[new Text("本月业绩"), new Text("0")],
                  ),
                ),
                new RaisedButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.add),
                    label: Text('新增客源')),
              ],
            ),
          ),
          new Expanded(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildWidgetColumn(Colors.red, Icons.home, "二手房"),
                    buildWidgetColumn(Colors.blue, Icons.fiber_new, "新房"),
                    buildWidgetColumn(Colors.green, Icons.border_all, "商业"),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildWidgetColumn(Colors.green, Icons.people, "客源"),
                    buildWidgetColumn(Colors.blue, Icons.timer, "预约"),
                    buildWidgetColumn(Colors.red, Icons.transform, "待办任务"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
