import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:nociapp/application/user/user_bloc.dart';
import 'package:nociapp/infrastructure/auth/google_auth.dart';
import 'package:nociapp/infrastructure/repository/impl_user_repository.dart';
import 'package:nociapp/presentation/home/main.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("ログイン"),
          centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SignInButton(
                Buttons.Google,
                onPressed: () async{
                  var googleAuth = GoogleAuth();
                  await googleAuth.handleSignIn();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(
                      create: (BuildContext context) => UserBloc(userRepository: UserRepository()),
                      child: Home()
                  )));
                }
            )
          ],
        )
      )
    );
  }
}