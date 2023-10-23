class Article {
  final String title;
  final String text;
  final int price;

  Article({
    required this.title,
    required this.text,
    required this.price,
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
    );
  }
}
