import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: ColumnPrincipal());
  }

  // Construção da tela
  Widget ColumnPrincipal() {
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
            RecCentral()
          ]),
    );
  }

  Widget labelTitulo() {
    return Text(
      'Lyric finder',
      style: TextStyle(color: Colors.black, fontSize: 32),
    );
  }

  Widget RecCentral() {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        color: Color(0xFFEFF2C0),
        child: Text('Teste de texto que será a letra da musica'),
      ),
    );
  }

  Widget inputs() {
    return Column(
      children: [
        SizedBox(height: 8),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nome da música',
          ),
        ),
        SizedBox(height: 5),
        TextField(
          obscureText: true,
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
