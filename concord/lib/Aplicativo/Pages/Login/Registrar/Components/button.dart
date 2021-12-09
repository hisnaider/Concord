import 'package:flutter/material.dart';

class RRegistrarButton extends StatelessWidget {
  const RRegistrarButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 200,
          height: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(90),color: Colors.amber),
            child: Center(
              child: Text("Registrar",style: TextStyle(fontSize: 25,color: Colors.black),
            )
          ),
        );
    
  }
}