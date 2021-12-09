import 'package:flutter/material.dart';

InputDecoration decuser = InputDecoration(
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

InputDecoration decemail = InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: "Email",
          prefixIcon: Padding(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.email_outlined,
              color: Colors.amber,
              size: 30,
            )
          )
        );

InputDecoration decbirth = InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: "Data de nascimento",
          prefixIcon: Padding(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.cake_outlined,
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

InputDecoration decconfirmsenha = InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: "Confirmar senha",
          prefixIcon: Padding(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.vpn_key_outlined,
              color: Colors.amber,
              size: 30,
            )
          )
        );