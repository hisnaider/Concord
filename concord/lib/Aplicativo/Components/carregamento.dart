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
            color: Colors.amber,
            size: 150,
            lineWidth: 2,
          ),
          SpinKitPouringHourGlassRefined(
            color: Colors.amber,
            size:75,
          )
          ]
        ),
      ),
    );
  }
}