import 'package:flutter/material.dart';


const campotextodec = InputDecoration(
  contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(
              Radius.circular(40)
            )
          ),
          filled: true,
          fillColor: Color.fromRGBO(97, 97, 97,1),
);

Widget icone(icon) => Padding(padding: 
              EdgeInsets.zero,child: Icon(
                icon,
                color: Colors.amber,
                size: 30,
              )
            );