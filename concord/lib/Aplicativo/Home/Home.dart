import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("asd"),

      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
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
                        child: Align(child: Text("Conversas", style: TextStyle(fontSize: 20,color: Colors.white),)
                        ),
                      )
                    )
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: SizedBox(
                      
                      height: 40,
                      width: double.infinity,
                      
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: Colors.grey[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)
                            )
                          )
                        ),
                        onPressed: () { print("asd"); },
                        child: Align(child: Text("Grupos", style: TextStyle(fontSize: 20,color: Colors.white),))
                        ),
                      )
                    ),
                  )
                
              ],
            )
          ],),
      ),
    );
  }
}