import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier{
  static HomeController instance = HomeController();
  bool telaconversas = true;
  trocartela(){
    telaconversas = !telaconversas;
    print(telaconversas);
    notifyListeners();
  }
}