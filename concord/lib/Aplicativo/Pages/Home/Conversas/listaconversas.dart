import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/Services/contatos.dart';
import 'package:concord/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Components/Contatos.dart';

// ignore: must_be_immutable
class ListaConversas extends StatefulWidget {
  ListaConversas({ Key? key}) : super(key: key);

  @override
  _ListaConversasState createState() => _ListaConversasState();
}

class _ListaConversasState extends State<ListaConversas> {


  List <List <String>> lista = [
    ["https://tm.ibxk.com.br/2018/08/10/10220125688008.jpg","Doom Guy", "MATAR, MATAR, MATAR DEMONIOS!!!"],
    ["https://sm.ign.com/t/ign_br/news/9/9-things-y/9-things-you-probably-didnt-know-about-master-chie_zmy1.1200.jpg","Master Chief","Cortana é chata pra caralho"],
    ["https://cdn.ome.lt/gd9-IYHjEWhrCPbJzkmVUrUX7SU=/1200x630/smart/extras/conteudos/kratos1_vfVstSj.jpg", "Kratos", "O Thor ta fudido parceiro"],
    ["https://sm.ign.com/ign_br/screenshot/default/crash-bandicoot-4-its-about-time-ps4-playstation-4-12origina_3fs5.jpg", "Crash", "woah!"],
    ["https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c36bcfd7-00d2-40c2-bcc3-88397e26d9c4/dbppry3-4e44f521-2062-4178-b646-5d0ba323dc93.png/v1/fill/w_894,h_894,strp/sonico_model_download_for_cinema_4d_by_nathanzicaoficial_dbppry3-pre.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAwMDAiLCJwYXRoIjoiXC9mXC9jMzZiY2ZkNy0wMGQyLTQwYzItYmNjMy04ODM5N2UyNmQ5YzRcL2RicHByeTMtNGU0NGY1MjEtMjA2Mi00MTc4LWI2NDYtNWQwYmEzMjNkYzkzLnBuZyIsIndpZHRoIjoiPD0xMDAwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.zJA883e3v1XOXS7rVMEDGgMQEflpXf4XQT6Z05REen0","Sonico" , "Gotta go fast"],
    ["https://preview.redd.it/5ijb88ilnhy01.png?auto=webp&s=ce6441cc8bd0ed464379c56a1166d93517f6e065", "T-Posing Myers","Você ta exposto!"],
    ["https://i2.moyens.net/pt/images/2021/10/1633911164_Qual-e-o-Herobrine-mitico-no-Minecraft.jpg", "Herobrine", "..."] ,
    ["https://i.ytimg.com/vi/EpzHXni6Uko/maxresdefault.jpg","Claudette Dançante","Bora dançar carai"],
    ["https://i.kym-cdn.com/photos/images/original/001/456/187/f19.jpg", "Leon cagado", "Racoon City!"],
    ["https://i.kym-cdn.com/photos/images/facebook/000/929/007/f4d.jpg", "Nemesis", "STAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAARRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS!!!"]
    ];

  Widget teste(i){
    return Column(
      children: [
        GestureDetector(
            /*child: Contato(foto: i[0], nome: i[1],mensagem: ""
            ),*/
          )
        ,
        Divider(
          height: 5,
          color: Colors.grey[840],
          thickness: 0.5,
        )
      ],
    );          
  }

 
  

  @override
  Widget build(BuildContext context) {

    return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:10,right: 10 , top: 20),
                child: Visibility(
                  child: Container(),
                  /*child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (BuildContext context, int index) {
                      return teste(lista[index]);
                    },
            ),*/
          ),
        ),
      );
  }
}