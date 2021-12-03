import 'package:concord/Aplicativo/Home/Home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "nome",
      theme: ThemeData(
        primaryColor: Colors.amber,
        brightness: Brightness.dark
      ),
      home: Home(),
      
    );
  }
}