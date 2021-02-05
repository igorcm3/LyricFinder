class Translate {
  String id;
  int lang;
  String url;
  String text;

  Translate({this.id, this.lang, this.url, this.text});

  Translate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lang = json['lang'];
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lang'] = this.lang;
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
