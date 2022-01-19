import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseImagens{
  
  Future salvarimagem (File _imagem, String endereco) async {
    Reference ref = FirebaseStorage.instance.ref().child(endereco);
    UploadTask uploadTask = ref.putFile(_imagem);
  }

  Future<String> pegarurl (String endereco) async {
    Reference ref = FirebaseStorage.instance.ref().child(endereco);
    String url = await ref.getDownloadURL();
    return url;
  
  }

  Future<String> perfilImage(File? imagem, String endereco) async {
    if (imagem != null){
      await salvarimagem(imagem, endereco);
    }
    Reference ref = FirebaseStorage.instance.ref().child(endereco);
    String url = await ref.getDownloadURL();
    return url.toString();
  }
}