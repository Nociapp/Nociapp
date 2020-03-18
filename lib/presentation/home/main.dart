import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nociapp/application/user/user_bloc.dart';
import 'package:nociapp/application/user/user_event.dart';
import 'package:nociapp/application/user/user_state.dart';
import 'package:nociapp/presentation/home/appbar/bottom.dart';
import 'package:nociapp/presentation/home/appbar/menu.dart';
import 'package:nociapp/presentation/news/main.dart';
import 'package:nociapp/presentation/timetable/main.dart';

class Home extends StatefulWidget {
  Home({Key key}): super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  PageController _pageController;
  String _title;
  List<String> _titles = [
    "ニュース",
    "時間割"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _title = _titles.first;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (BuildContext context, UserState state) {
          if (state is Initial) {
            userBloc.add(Request());
            print("User requested.");
          }
          // Return main page after User loading completed.
          if (state is UserStream) {
            print("User loading completed.");
            return Scaffold(
                appBar: AppBar(
                    title: Text(_title),
                    centerTitle: true
                ),
                bottomNavigationBar: Bottom(pageController: _pageController),
                drawer: Theme(
                  data: Theme.of(context).copyWith(canvasColor: Colors.white),
                  child: Menu(user: state.user),
                ),
                body: PageView(
                  controller: _pageController,
                  onPageChanged: changePage,
                  children: <Widget>[
                    News(),
                    Timetable()
                  ],
                )
            );
          }
          return Container();
        }
    );
  }

  void changePage(int page) {
    setState(() {
      _title = _titles[page];
    });
  }
}