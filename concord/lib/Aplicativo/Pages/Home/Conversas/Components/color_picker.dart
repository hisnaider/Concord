import 'package:concord/Config/geral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TrocarCor extends StatefulWidget {
  const TrocarCor({ Key? key }) : super(key: key);

  @override
  _TrocarCorState createState() => _TrocarCorState();
}

  final bool colorPicker = false;


class _TrocarCorState extends State<TrocarCor> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
            visible: colorPicker,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: 300,
                color: Color.fromRGBO(0, 0, 0, 0.7),
                
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    width: 250,
                    child: ColorPicker(
                      pickerColor: corPrimaria,
                      colorPickerWidth: 300,
                      pickerAreaHeightPercent: 0.4,
                      enableAlpha: false,
                      displayThumbColor: true,
                      pickerAreaBorderRadius: BorderRadius.all(Radius.circular(5)),
                      onColorChanged: (Color value) {
                        setState(() {
                          trocarCorPrimaria(value);
                          }
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}