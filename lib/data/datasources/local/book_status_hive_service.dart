import 'package:hive/hive.dart';
import '../../models/hive_book_status_model.dart';
import '../../../core/constants/hive_constants.dart';

class BookStatusHiveService {
  late Box<HiveBookStatusModel> _box;

  Future<void> init() async {
    _box = Hive.box<HiveBookStatusModel>(HiveConstants.bookStatusBox);
  }

  bool isBookRead(String bookId) {
    final status = _box.get(bookId);
    return status?.isRead ?? false;
  }

  Future<void> toggleBookStatus(String bookId) async {
    final existing = _box.get(bookId);

    if (existing != null) {
      existing.isRead = !existing.isRead;
      await existing.save();
    } else {
      await _box.put(bookId, HiveBookStatusModel(bookId: bookId, isRead: true));
    }
  }

  Map<String, bool> getAllStatuses() {
    return _box.values.fold({}, (map, item) {
      map[item.bookId] = item.isRead;
      return map;
    });
  }
}
