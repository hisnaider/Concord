import 'package:concord/Aplicativo/Pages/Home/Home.dart';
import 'package:concord/Aplicativo/Pages/Login/login.dart';
import 'package:concord/Services/myuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Myuser?>(context);
    if (user == null) return Login();
    else return Home();
  }
}