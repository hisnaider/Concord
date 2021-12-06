import 'package:flutter/material.dart';

class Prevmensagem extends StatefulWidget {
  const Prevmensagem({ Key? key }) : super(key: key);

  @override
  _PrevmensagemState createState() => _PrevmensagemState();
}

class _PrevmensagemState extends State<Prevmensagem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
            flex: 3,
            child: Container(
              height: 55,
              width: 100, 
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[900]),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi erat sapien, porta vel lobortis at, convallis quis nisl.",
                            style: TextStyle(fontSize: 15)
                          ),
                        ),
                      ),
                      Icon(Icons.verified_outlined,size: 20,),
                    ],
                  )
                ],
              )
            )
          );
  }
}