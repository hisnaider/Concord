import 'package:flutter/material.dart';

class ButtonConversas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
          onTap: (){print("asdasdasd");},
          child: Container(
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180),bottomRight: Radius.circular(180)),color: Colors.amber),
            width: double.infinity,
              child: Center(
                child: Text("Conversas",style: TextStyle(fontSize: 20))
            ),
          ),
        ),
    ); 
  }
}

class ButtonGrupos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: 
      GestureDetector(
          onTap: (){print("asdasdasd");},
          child: Container(
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180),bottomRight: Radius.circular(180)),color: Colors.grey[800]),
            width: double.infinity,
            child: Center(child: Text("Grupos",style: TextStyle(fontSize: 20),)),
          ),
        ),
      );
  }
}


class ConversasClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(30, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {return oldClipper != this;}
}

class GruposClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width-30, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {return oldClipper != this;}
}