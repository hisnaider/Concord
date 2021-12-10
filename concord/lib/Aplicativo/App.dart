import 'package:concord/Services/auth.dart';
import 'package:concord/Services/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

          primaryColor: Colors.amber,
          brightness: Brightness.dark
        ),
        home: Wrapper()
        )
      );
        /*routes: {
          "/": (context) => Home(),
          "/Login": (context) => Login(),
          "/Register": (context) => Registrar(),
        },*/
        
      
    
  }
}