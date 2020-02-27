import 'package:flutter/material.dart';
import 'package:nociapp/presentation/home/main.dart';
import 'package:nociapp/presentation/theme.dart' as nocia;

class App extends StatelessWidget {
  const App({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return nocia.NociaTheme(
      title: "Test",
      theme: nocia.Theme.Light,
      home: Home()
    );
  }
}