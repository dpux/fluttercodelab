import 'package:codelabfirstapp/friendlyapp/chat_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

buildFriendlyApp() {


  final ThemeData kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light,
  );

  final ThemeData kDefaultTheme = new ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.orangeAccent[400],
  );

  return MaterialApp(
    title: "Friendly Chat",
    theme: defaultTargetPlatform == TargetPlatform.iOS         //new
        ? kIOSTheme                                              //new
        : kDefaultTheme,
//    themeMode: ThemeMode.dark,  doesnt work
    home: ChatScreen(),
  );
}
