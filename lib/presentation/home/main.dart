import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nociapp/application/user/user_bloc.dart';
import 'package:nociapp/application/user/user_event.dart';
import 'package:nociapp/application/user/user_state.dart';

class Home extends StatefulWidget {
  Home({Key key}): super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (BuildContext context, UserState state) {
          if (state is Initial) {
            userBloc.add(Request());
            print("User requested.");
          }
          if (state is Loading) {
            print("User loading.");
          }
          if (state is Completed) {
            print("User loading completed.");
          }
          // Return main page after User loading completed.
          if (state is UserStream) {
            return Scaffold(
              body: Container()
            );
          }
          return Container();
        },
      )
    );
  }
}