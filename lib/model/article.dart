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
  String publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"]  ?? 'Anonim',
    title: json["title"]  ?? 'null',
    urlToImage: json["urlToImage"] ?? 'https://www.btklsby.go.id/images/placeholder/basic.png',
    publishedAt: json["publishedAt"] ?? 'null',
    content: json["content"] ?? 'null'
  );

}
