import 'package:flutter/material.dart';

InputDecoration decuser = InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(40))),
          filled: true,
          fillColor: Colors.grey[700],
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
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(40))),
          filled: true,
          fillColor: Colors.grey[700],
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
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(40))),
          filled: true,
          fillColor: Colors.grey[700],
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
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(40))),
          filled: true,
          fillColor: Colors.grey[700],
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
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(40))),
          filled: true,
          fillColor: Colors.grey[700],
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