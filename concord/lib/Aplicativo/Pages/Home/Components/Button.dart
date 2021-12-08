import 'package:flutter/material.dart';

class ButtonConversas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180),bottomRight: Radius.circular(180)),color: Colors.amber),
            width: double.infinity,
              child: Center(
                child: Text("Conversas",style: TextStyle(fontSize: 20))
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
      child: Container(
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180),bottomRight: Radius.circular(180)),color: Colors.grey[800]),
            width: double.infinity,
            child: Center(child: Text("Grupos",style: TextStyle(fontSize: 20),)),
          ),
        
      );
  }
}


