import 'package:flutter/material.dart';

InputDecoration decemail = InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: "Nome do usuario",
          prefixIcon: Padding(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.person_outline,
              color: Colors.amber,
              size: 30,
            )
          )
        );

InputDecoration decsenha = InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: "Senha",
          prefixIcon: Padding(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.vpn_key_outlined,
              color: Colors.amber,
              size: 30,
            )
          )
        );