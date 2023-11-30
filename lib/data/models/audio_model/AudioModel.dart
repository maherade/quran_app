class AudioModel {

  List<AudioFiles>? _audioFiles;

  AudioModel({List<AudioFiles>? audioFiles}) {
    if (audioFiles != null) {
      this._audioFiles = audioFiles;
    }
  }

  List<AudioFiles>? get audioFiles => _audioFiles;
  set audioFiles(List<AudioFiles>? audioFiles) => _audioFiles = audioFiles;

  AudioModel.fromJson(Map<String, dynamic> json) {
    if (json['audio_files'] != null) {
      _audioFiles = <AudioFiles>[];
      json['audio_files'].forEach((v) {
        _audioFiles!.add(new AudioFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._audioFiles != null) {
      data['audio_files'] = this._audioFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AudioFiles {
  int? _id;
  int? _chapterId;
  double? _fileSize;
  String? _format;
  String? _audioUrl;

  AudioFiles(
      {int? id,
        int? chapterId,
        double? fileSize,
        String? format,
        String? audioUrl}) {
    if (id != null) {
      this._id = id;
    }
    if (chapterId != null) {
      this._chapterId = chapterId;
    }
    if (fileSize != null) {
      this._fileSize = fileSize;
    }
    if (format != null) {
      this._format = format;
    }
    if (audioUrl != null) {
      this._audioUrl = audioUrl;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get chapterId => _chapterId;
  set chapterId(int? chapterId) => _chapterId = chapterId;
  double? get fileSize => _fileSize;
  set fileSize(double? fileSize) => _fileSize = fileSize;
  String? get format => _format;
  set format(String? format) => _format = format;
  String? get audioUrl => _audioUrl;
  set audioUrl(String? audioUrl) => _audioUrl = audioUrl;

  AudioFiles.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _chapterId = json['chapter_id'];
    _fileSize = json['file_size'];
    _format = json['format'];
    _audioUrl = json['audio_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['chapter_id'] = this._chapterId;
    data['file_size'] = this._fileSize;
    data['format'] = this._format;
    data['audio_url'] = this._audioUrl;
    return data;
  }
}