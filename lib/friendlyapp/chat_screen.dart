import 'package:codelabfirstapp/friendlyapp/chat_message.dart';
import 'package:codelabfirstapp/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key key,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing = false;

  @override
  void dispose() {
    //only available in stateful
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                onChanged: (value) {
                  setState(() {
                    _isComposing = value.trim().isNotEmpty;
                  });
                },
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            isiOS(context)
                ? CupertinoButton(
                    child: Text('Send'),
                    onPressed: () => _isComposing
                        ? _handleSubmitted(_textController.text)
                        : null,
                  )
                : IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _isComposing
                        ? _handleSubmitted(_textController.text)
                        : null,
                  )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendly Chat'),
        elevation: isiOS(context) ? 0.0 : 4.0,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _messages[index];
              },
              reverse: true,
            ),
          ),
          Divider(height: 1.0),
          Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer())
        ],
      ),
    );
  }

  void _handleSubmitted(String value) {
    print(value);
    _textController.clear();

    var msg = ChatMessage(
      //can'd do const msg!
      text: value,
      animationController: AnimationController(
          duration: Duration(milliseconds: 1000), vsync: this),
    );
    setState(() {
      _isComposing = false;
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }
}
