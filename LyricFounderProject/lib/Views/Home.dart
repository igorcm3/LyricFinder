import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  // api key cbce047af3f2e4571ae6643740fe5c40

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: columnPrincipal());
  }

  // Construção da tela
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
          'Teste de letra teste Po;oa0',
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
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nome da música',
          ),
        ),
        SizedBox(height: 5),
        TextField(
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
        onPressed: () {},
        color: Colors.red,
        textColor: Colors.white,
        child: Text("Pesquisar música".toUpperCase(),
            style: TextStyle(fontSize: 14)));
  }
}
