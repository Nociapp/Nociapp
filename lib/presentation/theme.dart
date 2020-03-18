import 'package:flutter/material.dart';

enum Theme {
  Light, Dark
}

class NociaTheme extends StatelessWidget {
  final String title;
  final Theme theme;
  final Widget home;

  const NociaTheme({
    @required this.title,
    @required this.theme,
    @required this.home
  }): assert(title != null),
      assert(theme != null),
      assert(home != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.title,
      theme: this.theme == Theme.Light ? lightTheme : darkTheme,
      home: this.home
    );
  }

  get lightTheme => ThemeData();

  get darkTheme => ThemeData(
    bottomAppBarTheme: BottomAppBarTheme(color: darkColor),
    appBarTheme: AppBarTheme(color: darkColor),
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    scaffoldBackgroundColor: darkColor
  );

  static get lightColor => Colors.white;

  static get darkColor => Color.fromRGBO(58, 66, 86, 1.0);
}