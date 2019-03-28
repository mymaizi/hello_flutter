import 'package:flutter/material.dart';
import 'package:hello_flutter/tabmain.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
        body: new Container(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage("images/cover.jpeg"), fit: BoxFit.fill)),
            child: new ListView(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 20),
                  child: new SizedBox(
                    height: ScreenUtil().setHeight(250),
                    child: new FittedBox(
                      child: new ClipOval(
                        child: Image.asset("images/app.png"),
                      ),
                    ),
                  ),
                ),
                new TextField(
                  controller: _nameController,
                  decoration: new InputDecoration(
                      hintText: "请输入账号",
                      icon: new Icon(Icons.account_box),
                      suffixIcon: new IconButton(
                        icon: new Icon(Icons.clear),
                        onPressed: () {
                          _nameController.clear();
                        },
                      )),
                ),
                new TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: new InputDecoration(
                        hintText: "请输入密码",
                        icon: new Icon(Icons.lock),
                        suffixIcon: new IconButton(
                          icon: new Icon(Icons.clear),
                          onPressed: () {
                            _passController.clear();
                          },
                        ))),
                new Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: new RaisedButton(
                      color: Colors.blue,
                      child: new Text(
                        "快速登录",
                        style: new TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new TabMain()));
                      }),
                ),
              ],
            )));
  }
}
