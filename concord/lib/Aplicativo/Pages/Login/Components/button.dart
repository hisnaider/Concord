import 'package:concord/Aplicativo/Pages/Login/Registrar/registrar.dart';
import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';

class RegistrarButton extends StatelessWidget {
  const RegistrarButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90)
        )
        
      ),
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Registrar()));},
      child: Text("Registrar", style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.normal)
      )
    );
  }
}
