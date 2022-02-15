import 'package:flutter/material.dart';


class Carregando1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(  
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.black.withOpacity(0.2),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 125,
              height: 20,
              color: Colors.black.withOpacity(0.2),
            ),
          ]
        )
      ),
    );
  }
}


class Carregando2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black.withOpacity(0.2),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 20,
                      width: 50,
                      color: Colors.black.withOpacity(0.2),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      ///height: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 10,width: 100,color: Colors.black.withOpacity(0.2),),
                          SizedBox(height: 10,),
                          Container(height: 10,width: 150,color: Colors.black.withOpacity(0.2),)
      
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),  
          ),
        Divider(height: 25,thickness: 1,)
      ],
    );
  }
}
