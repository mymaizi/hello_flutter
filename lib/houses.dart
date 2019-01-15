import 'package:flutter/material.dart';
import 'package:hello_world/MultipleDropDownButton.dart';

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
      body: MultipleDropDownButton(
        borderColor: Colors.grey[300],
        children: <MultipleDropDownButtonItem>[
          MultipleDropDownButtonItem(
              "区域",
              Container(
                  child: Text("区域"),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey[300], width: 1.5))))),
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
    );
  }
}
