class Article {
  final String title;
  final String text;
  String imageUrl = '';
  int price;

  Article({
    required this.title,
    required this.text,
    this.price = 0,
    this.imageUrl = '',
  });

  @override
  String toString() {
    return 'Article: {title: $title, text: $text, price: $price}';
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"] as String,
      text: json["text"] as String,
      price: json["price"] as int,
      imageUrl: json["imageUrl"] as String,
    );
  }
}
