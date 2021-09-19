import 'package:annotations/annotations.dart';
import 'package:example/example.dart';
import 'package:flutter/material.dart';

part 'animated_switcher_example.g.dart';

@generateCodeSnapshot
class AnimatedSwitcherExample extends Example {
  @override
  get code => sourceCode;

  @override
  State<StatefulWidget> createState() {
    return _AnimatedSwitcherExample();
  }
}

class _AnimatedSwitcherExample extends State<AnimatedSwitcherExample> {
  Text txt1 = Text("Remover");
  Text txt2 = Text("Lista de CPFs");

  Widget wrap(Widget widget, Key key) {
    return Container(
      width: 100,
      height: 100,
      key: key,
      color: Colors.blue,
      child: widget,
    );
  }

  late Widget child;
  bool isKey1 = true;

  @override
  void initState() {
    super.initState();
    child = wrap(txt1, ValueKey(1));
  }

  void change() {
    setState(() {
      child = isKey1 ? wrap(txt1, ValueKey(2)) : wrap(txt1, ValueKey(1));
    });
    isKey1 = !isKey1;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TextButton(
          onPressed: () {
            change();
          },
          child: Text("Change"),
        ),
        Wrap(
          children: [
            Container(
              width: 400,
              height: 500,
              child: AnimatedSwitcher(
                  duration: Duration(seconds: 2),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    // return ScaleTransition(
                    //   scale: animation,
                    //   child: child,
                    // );
                    // return RotationTransition(turns: animation, child: child,);
                    // return FadeTransition(opacity: animation, child: child,);
                    // return PositionedTransition(rect: animation, child: child);
                    return PositionedTransition(
                        rect: RelativeRectTween(
                            begin: RelativeRect.fromSize(
                                const Rect.fromLTWH(0, 0, 100, 100),
                                Size(400, 500)),
                            end: RelativeRect.fromSize(
                                const Rect.fromLTWH(300, 400, 100, 100),
                                Size(400, 500))
                        ).animate(animation),
                        child: child);
                  },
                  // switchInCurve: Curves.linearToEaseOut,
                  child: child),
            ),
          ],
        )
      ],
    );
  }
}
