import 'package:concord/Aplicativo/Home/Components/Button.dart';
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
                ButtonConversas(),
                ButtonGrupos(),
              
                
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:10, top: 20),
                child: ListView(
                  children: [
                    Container(
                      height: 50,
                      width: 1000,
                      ///color: Colors.orange,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: 
                              BoxDecoration(borderRadius: BorderRadius.circular(360),
                              image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/Image/pp.jpg")
                              ),
                            )
                          )
                        ],  
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}