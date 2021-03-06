import 'dart:ui';
import 'package:flutter/material.dart';

import '../screens/detailed_screen.dart';

class TileItem extends StatefulWidget {
  final bool isChecked;
  final String image;
  final String title;

  final Function onCheckedChanges;

  TileItem({
    this.isChecked = false,
    @required this.title,
    this.image,
    @required this.onCheckedChanges,
  });

  @override
  _TileItemState createState() => _TileItemState();
}

class _TileItemState extends State<TileItem>
    with SingleTickerProviderStateMixin {
  AnimationController  controller;
  Animation<double> offsetAnimation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    offsetAnimation = Tween(begin: 0.0, end: 12.0)
        .chain(CurveTween(curve: Curves.linear))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isImageExists = !(widget.image == null);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedScreen(itemText: widget.title)),
        );
      },
      child: Hero(
        tag: 'flippers',
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
          child: Row(
            children: [
              Checkbox(
                value: widget.isChecked,
                checkColor: Colors.white70,
                activeColor: widget.isChecked ? Colors.grey : Colors.black,
                onChanged: (bool value) {
                  widget.onCheckedChanges(value ?? false);
                },
              ),
              Expanded(
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget child) {
                      return Container(
                        margin: EdgeInsets.only(left: offsetAnimation.value),
                        child: widget.isChecked
                            ? showStrokedText()
                            : showNormalText(),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                width: isImageExists ? 60.0 : 10.0,
                height: 60.0,
                child: isImageExists
                    ? Image(
                        image: AssetImage('assets/image/ava2.png'),
                        color: widget.isChecked ? Colors.white : null,
                        colorBlendMode:
                            widget.isChecked ? BlendMode.softLight : null,
                        fit: BoxFit.fill,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showStrokedText() => AnimatedDefaultTextStyle(
    curve: Curves.easeInBack,
        duration: const Duration(milliseconds: 1000),
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
          decorationStyle: TextDecorationStyle.dashed,
          fontStyle: FontStyle.italic,
          color: Colors.black,
          fontSize: 25,
        ),
        child: Text(
          widget.title,
        ),
      );

  showNormalText() => Text(
        widget.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontFamily: 'DancingScript', fontSize: 24),
      );
}
