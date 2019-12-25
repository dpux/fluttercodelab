import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final _name = 'Deepak';

  const ChatMessage({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(_name[0]),
          ),
          SizedBox(width: 8.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_name, style: Theme.of(context).textTheme.subhead),
              SizedBox(height: 5.0,),
              Text(text),
            ],
          )
        ],
      ),
    );
  }
}
