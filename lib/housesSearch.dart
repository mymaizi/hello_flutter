import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HousesSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HousesSearchState();
  }
}

class HousesSearchState extends State<HousesSearch> {
  List<Widget> _createTag(List<String> tags) {
    List<Widget> _tags = new List();
    tags.forEach((item) {
      _tags.add(Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey[200]),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Text(
            item,
            style: TextStyle(fontSize: ScreenUtil().setSp(24)),
          ),
        ),
      ));
      _tags.add(Text(" "));
    });
    return _tags;
  }

  @override
  Widget build(BuildContext context) {
    List<String> _tags = new List();
    _tags.add("精装修");
    _tags.add("投资");
    _tags.add("急售");
    return Material(
      color: Colors.blue,
      child: SafeArea(
          child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
                color: Colors.blue,
                height: ScreenUtil().setHeight(110),
                padding: EdgeInsets.only(left: 4, right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Container(
                        height: 34,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border: Border.all(color: Colors.grey[100]),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: PopupMenuButton(
                                child: Row(
                                  children: <Widget>[
                                    Text("二手房"),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                                itemBuilder: (context) {
                                  List<PopupMenuItem> _items = new List();
                                  _items.add(PopupMenuItem(
                                    child: Text("二手房"),
                                  ));
                                  _items.add(PopupMenuItem(
                                    child: Text("新房"),
                                  ));
                                  return _items;
                                },
                              ),
                            ),
                            Container(
                              height: ScreenUtil().setHeight(30),
                              width: 1,
                              color: Colors.grey[300],
                            ),
                            Expanded(
                              child: TextField(
                                  textInputAction: TextInputAction.search,
                                  decoration: new InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      border: InputBorder.none,
                                      hintText: "搜索楼盘名称或房源编号",
                                      hintStyle: TextStyle(
                                          fontSize: ScreenUtil().setSp(30)))),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            Container(
              color: Colors.grey[200],
              height: ScreenUtil().setHeight(50),
              child: SizedBox.expand(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    child: Text(
                      "搜索记录",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          color: Colors.grey[500]),
                    ),
                    padding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
            ),
            Offstage(
              offstage: false,
              child: Container(
                height: 200,
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return Container(
                      color: Colors.grey[200],
                      height: ScreenUtil().setHeight(2),
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("我是标题，该我日白"),
                      subtitle: Text("我是标题的小弟，我ye很日白"),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 20),
              child: Text("清除搜索历史",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      color: Colors.grey[500])),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 6),
              color: Colors.grey[200],
              height: ScreenUtil().setHeight(50),
              child: SizedBox.expand(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    child: Text(
                      "猜你喜欢",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          color: Colors.grey[500]),
                    ),
                    padding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[200],
                    height: ScreenUtil().setHeight(2),
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                      height: ScreenUtil().setHeight(200),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2.0),
                              child: Image.network(
                                  "http://www.cqdaze.com/img/cq/news/200.jpg",
                                  height: ScreenUtil().setHeight(180)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "这里显示标题，标题要长，要粗，要直达灵魂深处",
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(30),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("5室2厅"),
                                        Text("100平米"),
                                        Text("      "),
                                        Text(
                                          "150万",
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(34),
                                              color: Colors.blue[200],
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: _createTag(_tags),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ));
                },
              ),

              /// 此组件会填满Row在主轴方向的剩余空间，撑开Row
            ),
          ],
        ),
      )),
    );
  }
}
