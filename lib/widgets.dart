import 'package:flutter/material.dart';

class taskWidget extends StatelessWidget {
  final title;
  final desc;
  taskWidget({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(30)),
      child: Column(children: [
        Text(
          title ?? "unnamed",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            desc ?? 'ว่างเปล่า',
            style: TextStyle(color: Colors.white, fontSize: 15, height: 1.6),
          ),
        )
      ]),
    );
  }
}

class todoWidget extends StatelessWidget {
  final text;
  final bool isDone;
  todoWidget({this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: isDone ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(5.0),
                border: isDone
                    ? null
                    : Border.all(color: Colors.black, width: 1.5)),
            child: Image(image: AssetImage('assets/images/clipart2185701.png')),
          ),
          Text(
            text ?? '(unnamed)',
            style: TextStyle(
              color: isDone ? Colors.black : Color(0x420000000),
            ),
          )
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
