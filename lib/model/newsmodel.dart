class NewsModel {
  final String author;
  final String imageUrl;
  final String title;

  NewsModel({
    required this.author,
    required this.imageUrl,
    required this.title,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageUrl'],
    );
  }
}
