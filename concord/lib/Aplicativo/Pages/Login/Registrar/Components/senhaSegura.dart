import 'package:flutter/material.dart';

class SenhaSegura extends StatefulWidget {
  final String senha;
  SenhaSegura({ required this.senha });

  @override
  _SenhaSeguraState createState() => _SenhaSeguraState();
}

class _SenhaSeguraState extends State<SenhaSegura> {

  bool tamSenha = false;
  bool numeros = false;
  bool upperSenha = false;
  bool caracteres = false;
  bool senhaGrande = false;


  @override
  
  Widget build(BuildContext context) {
    
    

    setState(() {
      tamSenha = widget.senha.length > 5;
      numeros = widget.senha.contains(RegExp(r'[0-9]'));
      upperSenha = widget.senha.contains(RegExp(r'[A-Z]')) && widget.senha.contains(RegExp(r'[a-z]'));
      caracteres = widget.senha.contains(RegExp(r'[!@#$%^&*(),.?:|<>=-_]'));
      senhaGrande = widget.senha.length > 9;
    });
  List<bool> lista = [tamSenha, numeros, upperSenha, caracteres, senhaGrande];

    String texto(){
      if (lista.where((e) => e == true).length > 4) return "Pica";
      if (lista.where((e) => e == true).length > 3) return "Otimo!!!";
      if (lista.where((e) => e == true).length > 2) return "Bom";
      if (lista.where((e) => e == true).length > 1) return "Da pra melhorar";
      if (lista.where((e) => e == true).length > 0) return "Fraco";
      else return "Coco";
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Text("Força da senha"),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 17,
                width: 40,
                color: lista.where((e) => e == true).length > 0 ? Colors.amber[500] : Colors.grey[600]!.withOpacity(0.5),),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 17,
                width: 40,
                color: lista.where((e) => e == true).length > 1 ? Colors.amber[700] : Colors.grey[600]!.withOpacity(0.5),),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 17,
                width: 40,
                color: lista.where((e) => e == true).length > 2 ? Colors.amber[900] : Colors.grey[600]!.withOpacity(0.5),),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 17,
                width: 40,
                color: lista.where((e) => e == true).length > 3 ? Colors.red : Colors.grey[600]!.withOpacity(0.5),),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 17,
                width: 40,
                color: lista.where((e) => e == true).length > 4 ? Colors.red[900] : Colors.grey[600]!.withOpacity(0.5),),
            )
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(texto(), style: TextStyle(fontSize: 30),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 15, height:1.7),
                children: [
                  TextSpan(text: "6 ou mais caracteres\n", style: TextStyle(color: tamSenha ? Colors.amber : Colors.grey[600])),
                  TextSpan(text: "10 ou mais caracteres\n", style: TextStyle(color: senhaGrande ? Colors.amber : Colors.grey[600])),
                  TextSpan(text: "Letras minusculas e maiusculas\n", style: TextStyle(color: upperSenha ? Colors.amber : Colors.grey[600])),
                  TextSpan(text: "Uma ou mais numeros\n", style: TextStyle(color: numeros ? Colors.amber : Colors.grey[600])),
                  TextSpan(text: "Uma ou mais caracteres especiais\n", style: TextStyle(color: caracteres ? Colors.amber : Colors.grey[600])),
                ]
              ),
            ),
          ),
        )
      ],
    );
  }
}