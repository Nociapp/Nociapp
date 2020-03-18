import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nociapp/application/user/user_bloc.dart';
import 'package:nociapp/infrastructure/repository/impl_user_repository.dart';
import 'package:nociapp/presentation/home/main.dart';
import 'package:nociapp/presentation/intro/main.dart';
import 'package:nociapp/presentation/theme.dart' as nocia;

class App extends StatelessWidget {
  const App({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return nocia.NociaTheme(
      title: "Test",
      theme: nocia.Theme.Dark,
      home: FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          var user = snapshot.data;
          if (user == null) {
            return Intro();
          }
          return BlocProvider(
              create: (BuildContext context) => UserBloc(userRepository: UserRepository()),
              child: Home()
          );
        }
      )
    );
  }
}