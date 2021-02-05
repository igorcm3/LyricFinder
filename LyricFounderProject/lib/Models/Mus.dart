import 'Translate.dart';

class Mus {
  String id;
  String name;
  String url;
  int lang;
  String text;
  List<Translate> translate;

  Mus({this.id, this.name, this.url, this.lang, this.text, this.translate});

  Mus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    lang = json['lang'];
    text = json['text'];
    if (json['translate'] != null) {
      translate = new List<Translate>();
      json['translate'].forEach((v) {
        translate.add(new Translate.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['lang'] = this.lang;
    data['text'] = this.text;
    if (this.translate != null) {
      data['translate'] = this.translate.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
