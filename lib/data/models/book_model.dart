class BookModel {
  final String id;
  final String title;
  final String author;
  final int? publishedYear;
  final int? coverId;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    this.publishedYear,
    this.coverId,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['key'] ?? '',
      title: json['title'] ?? 'Unknown Title',
      author:
          (json['author_name'] != null &&
                  (json['author_name'] as List).isNotEmpty)
              ? json['author_name'][0]
              : 'Unknown Author',
      publishedYear: (json['first_publish_year']),
      coverId: json['cover_i'],
    );
  }
}
