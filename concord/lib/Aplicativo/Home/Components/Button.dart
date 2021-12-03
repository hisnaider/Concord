
import 'package:flutter/material.dart';

class ButtonConversas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              primary: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
                )
              )
            ),
            onPressed: () { print("asd"); },
            child: Align(
              child: Text(
                "Conversas",
                style: TextStyle(fontSize: 20,color: Colors.white),
              )
            ),
          )
        )
      )
    );
  }
}

class ButtonGrupos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              primary: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
                )
              )
            ),
            onPressed: () { print("asd"); },
            child: Align(
              child: Text(
                "Grupos",
                style: TextStyle(fontSize: 20,color: Colors.white),
              )
            ),
          )
        )
      )
    );
  }
}