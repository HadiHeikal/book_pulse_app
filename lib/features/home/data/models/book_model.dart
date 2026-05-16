class BookModel {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String description;
  final double price;
  final double rating;
  final int ratingCount;
  final double readingProgress;
  final String genre;

  const BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.description,
    this.price = 0.0,
    this.rating = 0.0,
    this.ratingCount = 0,
    this.readingProgress = 0.0,
    this.genre = '',
  });
}
