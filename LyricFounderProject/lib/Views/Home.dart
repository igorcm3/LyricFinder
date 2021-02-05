import 'package:app/Controllers/LyricService.dart';
import 'package:app/Models/Mus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController artistaController = TextEditingController();
  TextEditingController musicacontroller = TextEditingController();
  String lyric = '';

  @override
  void initState() {
    super.initState();
    EasyLoading.init();
  }

  // @override
  // void deactivate() {
  //   EasyLoading.dismiss();
  //   super.deactivate();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: columnPrincipal());
  }

  Widget columnPrincipal() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            labelTitulo(),
            inputs(),
            btnPesquisarMusica(),
            recCentral()
          ]),
    );
  }

  Widget labelTitulo() {
    return Text(
      'Lyric finder',
      style: TextStyle(color: Colors.black, fontSize: 32),
    );
  }

  Widget recCentral() {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        color: Color(0xFFEFF2C0),
        child: Text(
          lyric,
          style: TextStyle(
              fontFamily: 'Inkfree', fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  Widget inputs() {
    return Column(
      children: [
        SizedBox(height: 8),
        TextField(
          controller: musicacontroller,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nome da música',
          ),
        ),
        SizedBox(height: 5),
        TextField(
          controller: artistaController,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Artista',
          ),
        ),
      ],
    );
  }

  Widget btnPesquisarMusica() {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.red)),
        onPressed: () {
          loadData();
        },
        color: Colors.red,
        textColor: Colors.white,
        child: Text("Pesquisar música".toUpperCase(),
            style: TextStyle(fontSize: 14)));
  }

  void loadData() {
    setState(() {
      EasyLoading.show();
      final service = LyricService();
      Future<Mus> musica = service.getLyric(
          artist: artistaController.text, song: musicacontroller.text);
      musica.then((value) {
        lyric = value.text;
        EasyLoading.dismiss();
      });
    });
  }
}
