class AudioModel {
  List<AudioFiles>? audioFiles;

  AudioModel({this.audioFiles});

  AudioModel.fromJson(Map<String, dynamic> json) {
    if (json['audio_files'] != null) {
      audioFiles = <AudioFiles>[];
      json['audio_files'].forEach((v) {
        audioFiles!.add(new AudioFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.audioFiles != null) {
      data['audio_files'] = this.audioFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AudioFiles {
  int? id;
  int? chapterId;
  double? fileSize;
  String? format;
  String? audioUrl;

  AudioFiles(
      {this.id, this.chapterId, this.fileSize, this.format, this.audioUrl});

  AudioFiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterId = json['chapter_id'];
    fileSize = json['file_size'];
    format = json['format'];
    audioUrl = json['audio_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapter_id'] = this.chapterId;
    data['file_size'] = this.fileSize;
    data['format'] = this.format;
    data['audio_url'] = this.audioUrl;
    return data;
  }
}
