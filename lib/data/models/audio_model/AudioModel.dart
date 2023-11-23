class AudioModel {
  int? code;
  String? status;
  AudioData? data;

  AudioModel({this.code, this.status, this.data});

  AudioModel.fromJson(Map<String, dynamic> json)
      : this(
    code : json['code'],
    status : json['status'],
    data : json['data']
  );

  Map<String, dynamic> toJson() {
    return {
      'code':  code,
      'status': status,
      'data': data,
    };
  }
}

class AudioData {
  List<Surahs>? surahs;
  Edition? edition;

  AudioData({this.surahs, this.edition});

  AudioData.fromJson(Map<String, dynamic> json) {
    if (json['surahs'] != null) {
      surahs = <Surahs>[];
      json['surahs'].forEach((v) {
        surahs!.add(Surahs.fromJson(v));
      });
    }
    edition =
    json['edition'] != null ? new Edition.fromJson(json['edition']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.surahs != null) {
      data['surahs'] = this.surahs!.map((v) => v.toJson()).toList();
    }
    if (this.edition != null) {
      data['edition'] = this.edition!.toJson();
    }
    return data;
  }
}

class Surahs {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<Ayahs>? ayahs;

  Surahs(
      {this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.revelationType,
        this.ayahs});

  Surahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(new Ayahs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['englishNameTranslation'] = this.englishNameTranslation;
    data['revelationType'] = this.revelationType;
    if (this.ayahs != null) {
      data['ayahs'] = this.ayahs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ayahs {
  int? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayahs(
      {this.number,
        this.audio,
        this.audioSecondary,
        this.text,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    audio = json['audio'];
    audioSecondary = json['audioSecondary'].cast<String>();
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['audio'] = this.audio;
    data['audioSecondary'] = this.audioSecondary;
    data['text'] = this.text;
    data['numberInSurah'] = this.numberInSurah;
    data['juz'] = this.juz;
    data['manzil'] = this.manzil;
    data['page'] = this.page;
    data['ruku'] = this.ruku;
    data['hizbQuarter'] = this.hizbQuarter;
    data['sajda'] = this.sajda;
    return data;
  }
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;

  Edition(
      {this.identifier,
        this.language,
        this.name,
        this.englishName,
        this.format,
        this.type});

  Edition.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['language'] = this.language;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['format'] = this.format;
    data['type'] = this.type;
    return data;
  }
}
