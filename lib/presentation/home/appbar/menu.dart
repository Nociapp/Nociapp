import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nociapp/application/user/user_bloc.dart';
import 'package:nociapp/domain/user.dart';
import 'package:nociapp/infrastructure/repository/impl_user_repository.dart';
import 'package:nociapp/presentation/home/main.dart';
import 'package:nociapp/presentation/intro/main.dart';

class Menu extends StatelessWidget {
  final User user;

  Menu({@required this.user}): assert(user != null);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: UserAccountsDrawerHeader(
              accountName: Text(user.firebaseUser.displayName),
              accountEmail: Text(user.firebaseUser.email),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(58, 66, 86, 1.0)
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(user.firebaseUser.photoUrl ?? "http://freeiconbox.com/icon/256/17004.png")
              )
            )
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('ホーム',style:  TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider<UserBloc>(
                create: (BuildContext context) => UserBloc(userRepository: UserRepository()),
                child: Home(),
              )));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('ログアウト',style:  TextStyle(color: Colors.black),),
            onTap: () async{
             await FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => Intro()));
            },
          ),
        ]
      )
    );
  }
}