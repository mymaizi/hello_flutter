import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ShowCallback = Function(bool flag);
typedef DisplayCallback = Function(String text);
Map<String, int> _indexs = new Map();
ScrollController _scrollController = new ScrollController();
GlobalKey _listKey = new GlobalKey();
int booksCount = 0;

class Book extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookState();
  }
}

class BookState extends State<Book> {
  bool isShow = false;
  String displayText = "";
  void _setShow(bool flag) {
    setState(() {
      isShow = flag;
    });
  }

  void _setDisplayText(String text) {
    setState(() {
      displayText = text;
      if (_indexs.containsKey(text)) {
        var o = _indexs[text].toDouble();
        var height = _listKey.currentContext.size.height;
        o = booksCount - o < height ? booksCount - height : o;
        _scrollController.jumpTo(o);
      }
    });
  }

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
              child: Character(
                showCallback: (bool flag) {
                  _setShow(flag);
                },
                displayCallback: (String text) {
                  _setDisplayText(text);
                },
              ),
            ),
            Align(
              child: Offstage(
                offstage: !isShow,
                child: Container(
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(160),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Center(
                    child: Text(
                      displayText,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(100),
                          color: Colors.white),
                    ),
                  ),
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
  final ShowCallback showCallback;
  final DisplayCallback displayCallback;
  Character(
      {Key key,
      @required ShowCallback this.showCallback,
      @required DisplayCallback this.displayCallback})
      : super(key: key);
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

  void _onTouch(bool flag) {
    setState(() {
      isOnTouch = flag;
      widget.showCallback(flag);
    });
  }

  void _setDisplayText(String text) {
    setState(() {
      widget.displayCallback(text);
    });
  }

  bool isOnTouch = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: ScreenUtil().setWidth(50),
          color: isOnTouch ? Colors.grey[400] : null,
          child: _Character(
            key: _ckey,
            data: _character,
          )),
      onVerticalDragDown: (details) {
        _onTouch(true);
        _initCharacterIndexList();
        RenderBox box = context.findRenderObject();
        Offset topLeftPosition = box.localToGlobal(Offset.zero);
        _widgetTop = topLeftPosition.dy.toInt();
      },
      onVerticalDragUpdate: (details) {
        int offset = details.globalPosition.dy.toInt() - _widgetTop;
        int index = _getCharacterIndex(offset);
        var c = _character[index];
        _setDisplayText(c);
      },
      onVerticalDragEnd: (details) {
        _onTouch(false);
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
  var list = [
    {
      "Group": "A",
      "Childs": [
        {"Name": "爱妃0", "Number": "a1230", "avatar": "images/avatar0.png"},
        {"Name": "爱妃1", "Number": "a1231", "avatar": "images/avatar1.png"},
        {"Name": "爱妃2", "Number": "a1232", "avatar": "images/avatar1.png"},
        {"Name": "爱妃3", "Number": "a1233", "avatar": "images/avatar1.png"},
        {"Name": "爱妃4", "Number": "a1234", "avatar": "images/avatar0.png"},
        {"Name": "爱妃4", "Number": "a1234", "avatar": "images/avatar0.png"},
        {"Name": "爱妃4", "Number": "a1234", "avatar": "images/avatar0.png"},
        {"Name": "爱妃4", "Number": "a1234", "avatar": "images/avatar0.png"},
        {"Name": "爱妃4", "Number": "a1234", "avatar": "images/avatar0.png"},
      ]
    },
    {
      "Group": "B",
      "Childs": [
        {"Name": "宝批龙1", "Number": "b1230", "avatar": "images/avatar1.png"},
        {"Name": "宝批龙2", "Number": "b1231", "avatar": "images/avatar0.png"},
        {"Name": "宝批龙3", "Number": "b1232", "avatar": "images/avatar1.png"},
        {"Name": "宝批龙4", "Number": "b1233", "avatar": "images/avatar0.png"},
        {"Name": "宝批龙5", "Number": "b1234", "avatar": "images/avatar1.png"}
      ]
    },
    {
      "Group": "M",
      "Childs": [
        {"Name": "王麻子0", "Number": "w1230", "avatar": "images/avatar1.png"},
        {"Name": "王麻子1", "Number": "w1231", "avatar": "images/avatar1.png"},
        {"Name": "王麻子2", "Number": "w1232", "avatar": "images/avatar0.png"},
        {"Name": "王麻子3", "Number": "w1233", "avatar": "images/avatar0.png"},
        {"Name": "王麻子0", "Number": "w1230", "avatar": "images/avatar1.png"},
        {"Name": "王麻子1", "Number": "w1231", "avatar": "images/avatar1.png"},
        {"Name": "王麻子2", "Number": "w1232", "avatar": "images/avatar0.png"},
        {"Name": "王麻子3", "Number": "w1233", "avatar": "images/avatar0.png"},
        {"Name": "王麻子0", "Number": "w1230", "avatar": "images/avatar1.png"},
        {"Name": "王麻子1", "Number": "w1231", "avatar": "images/avatar1.png"},
        {"Name": "王麻子2", "Number": "w1232", "avatar": "images/avatar0.png"},
        {"Name": "王麻子3", "Number": "w1233", "avatar": "images/avatar0.png"},
        {"Name": "王麻子4", "Number": "w1234", "avatar": "images/avatar1.png"}
      ]
    },
    {
      "Group": "W",
      "Childs": [
        {"Name": "王麻子0", "Number": "w1230", "avatar": "images/avatar1.png"},
        {"Name": "王麻子1", "Number": "w1231", "avatar": "images/avatar1.png"},
        {"Name": "王麻子2", "Number": "w1232", "avatar": "images/avatar0.png"},
        {"Name": "王麻子3", "Number": "w1233", "avatar": "images/avatar0.png"},
        {"Name": "王麻子4", "Number": "w1234", "avatar": "images/avatar1.png"}
      ]
    }
  ];
  int dyCount = 0;
  List<Widget> _creatList() {
    List<Widget> _list = [];
    dyCount = 0;
    booksCount = 0;
    list.forEach((item) {
      _list.add(Container(
        child: Text(item["Group"]),
        alignment: Alignment.centerLeft,
        color: Colors.grey[200],
        padding: EdgeInsets.only(left: 15),
        height: ScreenUtil().setHeight(70),
      ));
      (item["Childs"] as dynamic).forEach((item) {
        _list.add(ListTile(
          leading: Stack(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  item["avatar"],
                  width: ScreenUtil().setWidth(90),
                ),
              ),
            ],
          ),
          title: Text(item["Name"]),
        ));
      });
      int cCount = (item["Childs"] as dynamic).length * 56 + 45;
      booksCount = cCount + booksCount;
      _indexs[item["Group"]] = dyCount == 0 ? 0 : dyCount;
      dyCount = cCount + dyCount;
    });
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: _listKey,
      controller: _scrollController,
      children: _creatList(),
    );
  }
}
