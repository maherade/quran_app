class SurahModel {
  late int code;
 late String status;
  List<Data>? data;

  SurahModel({ this.data});

  SurahModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late int number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  Data(
      {
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.numberOfAyahs,
        this.revelationType});

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['englishNameTranslation'] = this.englishNameTranslation;
    data['numberOfAyahs'] = this.numberOfAyahs;
    data['revelationType'] = this.revelationType;
    return data;
  }
}
