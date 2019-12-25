import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;
  final _name = 'Deepak';

  const ChatMessage({Key key, this.text, this.animationController}) : super(key: key);

//  @override
//  void dispose() {
//    super.dispose();
//  }

    @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInCubic
      ),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Text(_name[0]),
            ),
            SizedBox(width: 8.0,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_name, style: Theme.of(context).textTheme.subhead),
                  SizedBox(height: 5.0,),
                  Text(text),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
