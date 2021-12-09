import 'package:concord/Aplicativo/Pages/Login/Registrar/registrar.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){print("asd");},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 150,
          height: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.amber),
            child: Center(
              child: Text("Entrar",style: TextStyle(fontSize: 22,color: Colors.black),
            )
          ),
        ),
    );
  }
}

class RegistrarButton extends StatelessWidget {
  const RegistrarButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Registrar()));},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 150,
          height: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.amber),
            child: Center(
              child: Text("Registrar",style: TextStyle(fontSize: 22,color: Colors.black),
            )
          ),
        ),
      );
    
  }
}


class ButtonClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width-20, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {return oldClipper != this;}
}