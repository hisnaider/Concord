import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';


const campotextodec = InputDecoration(
  contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(
              Radius.circular(40)
            ),
            
          ),
          
          filled: true,
          fillColor: Color.fromRGBO(40, 40, 40,1),
);

Widget icone(icon) => Padding(padding: 
              EdgeInsets.zero,
              child: Icon(
                icon,
                color: cor_primaria,
                size: 25,
              )
            );