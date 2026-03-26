import 'package:isar/isar.dart';

part 'unlocked_word.g.dart';

@collection
class UnlockedWord {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String wordId; // Lưu mã từ vựng (VD: 0034_tôi)

  late int currentRank; // 1 -> 4

  late DateTime unlockedAt;
}