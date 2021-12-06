import 'package:flutter/material.dart';

class CampoDeTextoEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.grey[700]),
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(right: 5),
            height: 40,
            width: 60,
            child: Icon(
              Icons.email_outlined,color:Colors.amber,size: 30,
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

class CampoDeTextoSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.grey[700]),
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(right: 5),
            height: 40,
            width: 60,
            child: Icon(
              Icons.vpn_key_outlined,color:Colors.amber,size: 30,
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







/*class IconeClipper extends CustomClipper<Path> {

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








Container(
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
                Icons.email_outlined,color:Colors.amber,size: 30,
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
}*/