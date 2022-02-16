import 'dart:developer';

import 'package:app/Models/Mus.dart';
import 'package:dio/dio.dart';

class LyricService {
  final String urlApi = "https://api.vagalume.com.br/search.php";
  final String apiKey = "cbce047af3f2e4571ae6643740fe5c40";
  final Dio _dio = Dio();
  LyricService();

  Future<Mus> getLyric({String artist, String song}) async {
    Mus result;
    try {
      final response = await _dio.get(
          urlApi + "?art=" + artist + "&mus=" + song + "&apikey=" + apiKey);
      if (response.statusCode == 200) {
        if ((response.data["type"] == "notfound") ||
            (response.data["type"] == "song_notfound")) {
          result = Mus(text: 'Música não encontrada. Tente novamente');
        } else {
          result = Mus.fromJson(response.data["mus"][0]);
        }
      } else {
        result = Mus(text: 'Erro ao comunicar com o servidor. Tente novamente');
      }
    } catch (e) {
      log(e);
    }
    return result;
  }
}
