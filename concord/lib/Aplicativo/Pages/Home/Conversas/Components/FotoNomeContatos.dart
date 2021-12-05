import 'package:flutter/material.dart';

class FotoNome extends StatefulWidget {
  const FotoNome({ Key? key }) : super(key: key);

  @override
  _FotoNomeState createState() => _FotoNomeState();
}

class _FotoNomeState extends State<FotoNome> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){print("foto");},
            child: Container(
              height: 70,
              width: 70,
              decoration: 
                BoxDecoration(borderRadius: BorderRadius.circular(360),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/Image/pp.jpg")
                ),
              )
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15,right: 10),
              width: 100,
              child: Text(
                "Julia Gonzalez",
                style: TextStyle(fontSize: 17))
            ),
          ),
        ],
      ),
    );
  }
}