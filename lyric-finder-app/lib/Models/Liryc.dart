import 'Art.dart';
import 'Mus.dart';

class Lyric {
  String type;
  Art art;
  List<Mus> mus;
  bool badwords;

  Lyric({this.type, this.art, this.mus, this.badwords});

  Lyric.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    art = json['art'] != null ? new Art.fromJson(json['art']) : null;
    if (json['mus'] != null) {
      mus = new List<Mus>();
      json['mus'].forEach((v) {
        mus.add(new Mus.fromJson(v));
      });
    }
    badwords = json['badwords'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.art != null) {
      data['art'] = this.art.toJson();
    }
    if (this.mus != null) {
      data['mus'] = this.mus.map((v) => v.toJson()).toList();
    }
    data['badwords'] = this.badwords;
    return data;
  }
}
