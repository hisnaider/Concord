import 'package:concord/Config/geral.dart';
import 'package:concord/Services/auth.dart';
import 'package:concord/Services/models/myuser.dart';
///import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Pages/wrapper.dart';


class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Myuser?>.value(
      value: Autenticador().user,
      initialData: null,
      child: MaterialApp(
        title: "nome",
        theme: ThemeData(

          primaryColor: corPrimaria,
          brightness: Brightness.dark
        ),
        home: Wrapper()
        )
      );
  }
}