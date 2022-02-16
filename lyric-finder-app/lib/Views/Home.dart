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
  String lyric = 'Busque por uma música =)';
  FocusScopeNode currentFocus;

  @override
  void initState() {
    super.initState();
    EasyLoading.init();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    currentFocus = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: columnPrincipal(),
    );
  }

  Widget columnPrincipal() {
    return SingleChildScrollView(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 37,
              ),
              labelTitulo(),
              inputs(),
              recCentral()
            ]),
      ),
    ));
  }

  Widget labelTitulo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              //Icon(Icons.ac_unit),
              Image(
                image: AssetImage(
                    'assets/icons/favicon_96x96_created_by_logaster.png'),
                width: 28,
                height: 28,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Lyric finder',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Inkfree',
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
        ),
        Container(child: btnPesquisarMusica())
      ],
    );
  }

  Widget recCentral() {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        color: Color(0xFFF6F5AE), // EFF2C0, E6F9AF, F5F749,
        child: SingleChildScrollView(
          child: Text(
            lyric,
            style: TextStyle(
                fontFamily: 'GOTHIC', fontSize: 16, color: Colors.black),
          ),
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
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(12)),
        ),
        SizedBox(height: 5),
        TextField(
          controller: artistaController,
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Artista',
              isDense: true, // Added this
              contentPadding: EdgeInsets.all(15)),
        ),
        SizedBox(height: 10)
      ],
    );
  }

  Widget btnPesquisarMusica() {
    return RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.red)),
        onPressed: () {
          setState(() {
            lyric = 'Buscando...';
          });
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          loadData();
        },
        color: Colors.red,
        textColor: Colors.white,
        child: Row(
          children: [
            Text("Buscar".toUpperCase(), style: TextStyle(fontSize: 14)),
            SizedBox(
              width: 7,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
            )
          ],
        ));
  }

  void loadData() {
    EasyLoading.show();
    final service = LyricService();
    Future<Mus> musica = service.getLyric(
        artist: artistaController.text, song: musicacontroller.text);
    musica.then((value) {
      setState(() {
        lyric = value.text;
      });
      EasyLoading.dismiss();
    });
  }
}
