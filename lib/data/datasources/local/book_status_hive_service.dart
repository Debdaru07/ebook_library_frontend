import 'package:hive/hive.dart';
import '../../models/hive_book_status_model.dart';
import '../../../core/constants/hive_constants.dart';

class BookStatusHiveService {
  Box<HiveBookStatusModel>? _box;

  Future<void> init() async {
    if (!Hive.isBoxOpen(HiveConstants.bookStatusBox)) {
      _box = await Hive.openBox<HiveBookStatusModel>(
        HiveConstants.bookStatusBox,
      );
    } else {
      _box = Hive.box<HiveBookStatusModel>(HiveConstants.bookStatusBox);
    }
  }

  Box<HiveBookStatusModel> get box {
    if (_box == null) {
      throw Exception('BookStatusHiveService not initialized');
    }
    return _box!;
  }

  bool isBookRead(String bookId) {
    final status = box.get(bookId);
    return status?.isRead ?? false;
  }

  Future<void> toggleBookStatus(String bookId) async {
    final existing = box.get(bookId);

    if (existing != null) {
      existing.isRead = !existing.isRead;
      await existing.save();
    } else {
      await box.put(bookId, HiveBookStatusModel(bookId: bookId, isRead: true));
    }
  }

  Map<String, bool> getAllStatuses() {
    return box.values.fold({}, (map, item) {
      map[item.bookId] = item.isRead;
      return map;
    });
  }
}
