import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Book extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("通讯录"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.search),
              onPressed: () {},
            ),
            new IconButton(
              icon: new Icon(Icons.record_voice_over),
              onPressed: () {},
            ),
          ],
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[
            Books(),
            Align(
              alignment: Alignment.centerRight,
              child: Character(),
            ),
            Align(
              child: Container(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(160),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Center(
                  child: Text("A",style: TextStyle(fontSize: ScreenUtil().setSp(80),color: Colors.white),),
                ),
              ),
              alignment: Alignment.center,
            )
          ],
        ));
  }
}

class _Character extends StatefulWidget {
  final List<String> data;
  _Character({Key key, List<String> this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CharacterState();
  }
}

class _CharacterState extends State<_Character> {
  Widget _bindCharacter(String text) {
    return Expanded(
        child: Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(32, false), color: Colors.grey[800]),
      ),
      alignment: Alignment.center,
    ));
  }

  List<Widget> _creatCharacter() {
    List<Widget> _list = [];
    for (int i = 0; i < widget.data.length; i++) {
      _list.add(_bindCharacter(widget.data[i].toString()));
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _creatCharacter(),
    );
  }
}

class Character extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CharacterState();
  }
}

class CharacterState extends State<Character> {
  List<int> _characterIndexList = new List();
  GlobalKey _ckey = new GlobalKey();
  int _widgetTop = -1;
  var _character = [
    "↑",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "#"
  ];
  void _initCharacterIndexList() {
    _characterIndexList.clear();
    RenderBox box = _ckey.currentContext.findRenderObject();
    int tempHeight = 0;
    for (int i = 0; i <= _character.length; i++) {
      tempHeight = tempHeight + (box.size.height ~/ _character.length);
      _characterIndexList.add(tempHeight);
    }
  }

  int _getCharacterIndex(int offset) {
    int length = _characterIndexList.length;
    for (int i = 0; i < length - 1; i++) {
      int a = _characterIndexList[i];
      int b = _characterIndexList[i + 1];
      if (offset >= a && offset < b) {
        return i;
      }
    }
    return -1;
  }

  void onTouch(flag) {
    setState(() {
      isOnTouch = flag;
    });
  }

  bool isOnTouch = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: ScreenUtil().setWidth(45),
          color: isOnTouch ? Colors.grey[200] : null,
          child: _Character(
            key: _ckey,
            data: _character,
          )),
      onVerticalDragDown: (details) {
        onTouch(true);
        _initCharacterIndexList();
        RenderBox box = context.findRenderObject();
        Offset topLeftPosition = box.localToGlobal(Offset.zero);
        _widgetTop = topLeftPosition.dy.toInt();
      },
      onVerticalDragUpdate: (details) {
        int offset = details.globalPosition.dy.toInt() - _widgetTop;
        int index = _getCharacterIndex(offset);
        var c = _character[index];
        print(c);
      },
      onVerticalDragEnd: (details) {
        onTouch(false);
      },
    );
  }
}

class Books extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BooksState();
  }
}

class BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      if (index.isOdd) return new Divider();
      return new ListTile(
        leading: Stack(
          children: <Widget>[
            ClipOval(
              child: Container(
                width: ScreenUtil().setWidth(80),
                height: ScreenUtil().setHeight(75),
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(75),
              child: Center(
                child: Text("A"),
              ),
            )
          ],
        ),
        title: new Text("王麻子${index}"),
      );
    });
  }
}
