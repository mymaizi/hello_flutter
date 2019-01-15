import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleDropDownButton extends StatefulWidget {
  final List<MultipleDropDownButtonItem> children;
  final int height;
  final double borderWidth;
  final Color borderColor;
  MultipleDropDownButton(
      {Key key,
      this.children,
      this.height = 70,
      this.borderWidth = 1.5,
      this.borderColor = Colors.grey});
  @override
  State<StatefulWidget> createState() {
    return _MultipleDropDownButtonState();
  }
}

class MultipleDropDownButtonItem {
  final String title;
  final Widget child;
  final bool showArrow;
  const MultipleDropDownButtonItem(this.title, this.child,
      {this.showArrow = true});
}

class _MultipleDropDownButtonState extends State<MultipleDropDownButton>
    with WidgetsBindingObserver {
  _MultipleDropDownButtonRoute _multipleDropDownButtonRoute;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _removeMultipleDropDownButtonRoute();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    _removeMultipleDropDownButtonRoute();
  }

  @override
  void didUpdateWidget(MultipleDropDownButton oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _handleTap(MultipleDropDownButtonItem item) {
    final RenderBox button = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    _multipleDropDownButtonRoute =
        _MultipleDropDownButtonRoute(position: position, child: item.child);
    Navigator.push(context, _multipleDropDownButtonRoute);
  }

  void _removeMultipleDropDownButtonRoute() {
    _multipleDropDownButtonRoute?._dismiss();
    _multipleDropDownButtonRoute = null;
  }

  List<Widget> _createButtons() {
    List<Widget> buttons = [];
    widget.children.forEach((item) {
      Widget child = Expanded(
        child: GestureDetector(
          onTap: () {
            _handleTap(item);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(item.title),
              Icon(item.showArrow ? Icons.arrow_drop_down : null)
            ],
          ),
        ),
      );
      buttons.add(child);
    });

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(widget.height),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: widget.borderColor, width: widget.borderWidth)),
      ),
      child: Row(
        children: _createButtons(),
      ),
    );
  }
}

class _MultipleDropDownButtonRouteLayout extends SingleChildLayoutDelegate {
  _MultipleDropDownButtonRouteLayout(this.position);
  final RelativeRect position;
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints(
      minWidth: constraints.maxWidth,
      maxWidth: constraints.maxWidth,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double height = size.height - position.bottom;
    return new Offset(0.0, height);
  }

  @override
  bool shouldRelayout(_MultipleDropDownButtonRouteLayout oldDelegate) {
    return position != oldDelegate.position;
  }
}

class _MultipleDropDownButtonRoute extends PopupRoute {
  final RelativeRect position;
  final Widget child;
  _MultipleDropDownButtonRoute({this.position, this.child});
  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: Builder(
        builder: (BuildContext context) {
          return CustomSingleChildLayout(
            delegate: _MultipleDropDownButtonRouteLayout(position),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 100);

  void _dismiss() {
    navigator?.removeRoute(this);
  }
}
