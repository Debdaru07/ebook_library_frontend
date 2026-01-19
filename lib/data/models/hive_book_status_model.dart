import 'package:hive/hive.dart';

part 'hive_book_status_model.g.dart';

@HiveType(typeId: 1)
class HiveBookStatusModel extends HiveObject {
  @HiveField(0)
  final String bookId;

  @HiveField(1)
  bool isRead;

  HiveBookStatusModel({required this.bookId, required this.isRead});
}
