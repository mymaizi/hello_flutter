import 'package:flutter/material.dart';
import 'package:hello_world/MultipleDropDownButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Houses extends StatefulWidget {
  final String title;
  const Houses({Key key, this.title});

  @override
  State<StatefulWidget> createState() {
    return HousesState();
  }
}

class HousesState extends State<Houses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            MultipleDropDownButton(
              buttonBorderColor: Colors.grey[300],
              childBorderColor: Colors.grey[300],
              children: <MultipleDropDownButtonItem>[
                MultipleDropDownButtonItem("区域", Text("区域")),
                MultipleDropDownButtonItem(
                    "总价",
                    Container(
                      child: Text("总价"),
                    )),
                MultipleDropDownButtonItem(
                    "户型",
                    Container(
                      child: Text("户型"),
                    )),
                MultipleDropDownButtonItem(
                    "更多",
                    Container(
                      child: Text("更多"),
                    )),
              ],
            ),
            Expanded(
              child: HousesList(),
            )
          ],
        ));
  }
}

class HousesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HousesListState();
  }
}

class HousesListState extends State<HousesList> {
  final ScrollController _scrollController = new ScrollController();
  Future<void> _loadRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {});
    });
  }

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
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> _tags = new List();
    _tags.add("精装修");
    _tags.add("投资");
    _tags.add("急售");
    return RefreshIndicator(
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
                        padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        controller: _scrollController,
      ),
      onRefresh: _loadRefresh,
    );
  }
}
