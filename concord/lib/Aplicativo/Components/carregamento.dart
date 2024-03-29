import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TelaDeLoading extends StatelessWidget {
  const TelaDeLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      child: Center(
        child: Stack(
          children: [
          SpinKitRing(
            color: corPrimaria,
            size: 150,
            lineWidth: 2,
          ),
          SpinKitPouringHourGlassRefined(
            color: corPrimaria,
            size:75,
          )
          ]
        ),
      ),
    );
  }
}