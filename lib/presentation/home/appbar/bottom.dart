import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  final PageController pageController;

  Bottom({@required this.pageController});

  @override
  _Bottom createState() => _Bottom();
}

class _Bottom extends State<Bottom> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info, color: Colors.white),
              onPressed: () => onTapBottomNavigation(0)
            ),
            IconButton(
              icon: Icon(Icons.table_chart, color: Colors.white),
              onPressed: () => onTapBottomNavigation(1)
            ),
          ]
        )
      )
    );
  }

  void onTapBottomNavigation(int page) {
    setState(() {
      widget.pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease
      );
    });
  }
}