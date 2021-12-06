import 'package:concord/Aplicativo/Pages/Login/Registrar/Components/button.dart';
import 'package:flutter/material.dart';

import 'Components/campodetexto.dart';


class Registrar extends StatefulWidget {
  const Registrar({ Key? key }) : super(key: key);

  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(color: Colors.amber,)
              ],
            ),

          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    child: Text("Registrar", style: TextStyle(fontSize: 30),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 15),
                  child: RegistrarCampoDeTextoUsuario(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: RegistrarCampoDeTextoEmail(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: RegistrarCampoDeTextoBirth(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: RegistrarCampoDeTextoSenha(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: RegistrarCampoDeTextoSenha(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: RRegistrarButton(),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}