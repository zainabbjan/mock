class Posts {
  int? id;

  String? title;
  String? url;
  int likeCount;
  String? thumbnailUrl;

  Posts({this.id, this.title, this.url, this.thumbnailUrl,this.likeCount = 0});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
