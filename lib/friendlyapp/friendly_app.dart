import 'package:codelabfirstapp/friendlyapp/chat_screen.dart';
import 'package:flutter/material.dart';

buildFriendlyApp() {
  return MaterialApp(
    title: "Friendly Chat",
    theme: ThemeData.dark(),
//    themeMode: ThemeMode.dark,  doesnt work
    home: ChatScreen(),
  );
}
