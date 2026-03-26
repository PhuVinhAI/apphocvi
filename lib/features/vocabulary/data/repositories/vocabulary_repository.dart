import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/word_model.dart';

part 'vocabulary_repository.g.dart';

class VocabularyRepository {
  Future<List<WordModel>> loadAllWords() async {
    // Dùng AssetManifest để lấy danh sách toàn bộ các file đã được bundle trong app
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);

    // Lọc ra các file data.json nằm trong cấu trúc thư mục từ vựng
    final wordPaths = manifest
        .listAssets()
        .where((path) => path.startsWith('assets/data/') && path.endsWith('/data.json'))
        .toList();

    final List<WordModel> words = [];

    for (final path in wordPaths) {
      try {
        final jsonString = await rootBundle.loadString(path);
        final jsonData = json.decode(jsonString);
        words.add(WordModel.fromJson(jsonData));
      } catch (e) {
        // Log lại để dễ debug nếu có file data.json nào bị lỗi format
        print('Error parsing $path: $e');
      }
    }

    // Sắp xếp các từ vựng theo rank (thứ tự phổ biến)
    words.sort((a, b) => a.rank.compareTo(b.rank));

    return words;
  }
}

@riverpod
VocabularyRepository vocabularyRepository(VocabularyRepositoryRef ref) {
  return VocabularyRepository();
}

@riverpod
Future<List<WordModel>> allWords(AllWordsRef ref) async {
  final repo = ref.watch(vocabularyRepositoryProvider);
  return repo.loadAllWords();
}