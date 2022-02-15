import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';

ButtonStyle button(conversa) => TextButton.styleFrom(
  padding: EdgeInsets.zero,
  minimumSize: Size(0,50),
  primary: Colors.white,
  backgroundColor: conversa == true ? corPrimaria : Colors.grey[800],
  textStyle: TextStyle(fontSize: 20),
  shape: RoundedRectangleBorder(
    borderRadius:BorderRadius.only(
      bottomLeft: Radius.circular(180),
      bottomRight: Radius.circular(180)
    ),
  )
);

