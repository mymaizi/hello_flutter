import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Houses extends StatefulWidget {
  final String title;
  Houses({Key key, String this.title}) : super(key: key);

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
          ),
        ],
        title: Text(widget.title),
      ),
    );
  }
}
