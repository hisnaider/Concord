import 'package:flutter/material.dart';

class SobreApp extends StatelessWidget {
  final bool mostrar;
  SobreApp(this.mostrar,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.mostrar,
      child: Container(
        height: 50,
        color: Colors.grey[800],
      ),
    );
  }
}