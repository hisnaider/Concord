import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrarCampoDeTextoUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.grey[700],
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: IconeClipper(),
            child: Container(
              padding: EdgeInsets.only(right: 5),
              height: 40,
              width: 60,
              color: Colors.grey[800],
              child: Icon(
                Icons.person_outline_outlined,color:Colors.amber,size: 40,
              )
            )
          ),   
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: TextField(
                maxLines: 1,
                obscureText: true,
                style: TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 1/2),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Nome de usuario"
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}

class RegistrarCampoDeTextoEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.grey[700],
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: IconeClipper(),
            child: Container(
              padding: EdgeInsets.only(right: 5),
              height: 40,
              width: 60,
              color: Colors.grey[800],
              child: Icon(
                Icons.email_outlined,color:Colors.amber,size: 40,
              )
            )
          ),   
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 1/2),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Email"
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}

class RegistrarCampoDeTextoBirth extends StatefulWidget {
  const RegistrarCampoDeTextoBirth({ Key? key }) : super(key: key);

  @override
  _RegistrarCampoDeTextoBirthState createState() => _RegistrarCampoDeTextoBirthState();
}

class _RegistrarCampoDeTextoBirthState extends State<RegistrarCampoDeTextoBirth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.grey[700],
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: IconeClipper(),
            child: Container(
              padding: EdgeInsets.only(right: 5),
              height: 40,
              width: 60,
              color: Colors.grey[800],
              child: Icon(
                Icons.cake_outlined,color:Colors.amber,size: 40,
              )
            )
          ),   
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: TextField(
                maxLines: 1,
                keyboardType: TextInputType.datetime,
                style: TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 1/2),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Data de Nascimento"
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}



class RegistrarCampoDeTextoSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.grey[700],
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: IconeClipper(),
            child: Container(
              padding: EdgeInsets.only(right: 5),
              height: 40,
              width: 60,
              color: Colors.grey[800],
              child: Icon(
                Icons.vpn_key_outlined,color:Colors.amber,size: 40,
              )
            )
          ),   
          Expanded(
            flex: 1,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: TextField(
                maxLines: 1,
                obscureText: true,
                style: TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 1/2),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Senha"
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}







class IconeClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width-10, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {return oldClipper != this;}
}