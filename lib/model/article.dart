class Article {
  Article({
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  String author;
  String title;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"] == null ? null : json["author"],
    title: json["title"],
    urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] == null ? null : json["content"],
  );

}
