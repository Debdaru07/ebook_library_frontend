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

  factory BookModel.fromReadingLogJson(Map<String, dynamic> json) {
    final work = json['work'] ?? {};

    return BookModel(
      id: work['key'] ?? '',
      title: work['title'] ?? 'Unknown Title',
      author:
          (work['author_names'] != null &&
                  (work['author_names'] as List).isNotEmpty)
              ? work['author_names'][0]
              : 'Unknown Author',
      publishedYear: work['first_publish_year'],
      coverId: work['cover_id'],
    );
  }
}
