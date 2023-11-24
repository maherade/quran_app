class Azkar {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  Azkar(
      {this.category,
        this.count,
        this.description,
        this.reference,
        this.content});

  Azkar.fromJson(Map<String, dynamic> json) :this(
  category : json['category'],
  count : json['count'],
  description : json['description'],
  reference : json['reference'],
  content : json['content'],
  );

  Map<String, dynamic> toJson() {
   return {
   'category' : category,
   'count' : count,
   'description' : description,
   'reference' : reference,
   'content' : content,
   };
  }
}
