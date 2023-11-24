class TafseerModel {
  int? tafseerId;
  String? tafseerName;
  String? ayahUrl;
  int? ayahNumber;
  String? text;

  TafseerModel(
      {this.tafseerId,
      this.tafseerName,
      this.ayahUrl,
      this.ayahNumber,
      this.text});

  TafseerModel.fromJson(Map<String, dynamic> json)
      : this(
            tafseerId: json['tafseerId'],
            tafseerName: json['tafseerName'],
            ayahUrl: json['ayahUrl'],
            ayahNumber: json['ayahNumber'],
            text: json['text']);

  Map<String, dynamic> toJson() {
    return {
      'tafseerId': tafseerId,
      'tafseerName': tafseerName,
      'ayahUrl': ayahUrl,
      'ayahNumber': ayahNumber,
      'text': text,
    };
  }
}
