// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vocabularyRepositoryHash() =>
    r'139c3bb11f58336e6cc09cd3024f5a7ec807eca9';

/// See also [vocabularyRepository].
@ProviderFor(vocabularyRepository)
final vocabularyRepositoryProvider =
    AutoDisposeProvider<VocabularyRepository>.internal(
  vocabularyRepository,
  name: r'vocabularyRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vocabularyRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VocabularyRepositoryRef = AutoDisposeProviderRef<VocabularyRepository>;
String _$allWordsHash() => r'4348489ece77ac1ef62ed428dcdf1084c03e46e9';

/// See also [allWords].
@ProviderFor(allWords)
final allWordsProvider = AutoDisposeFutureProvider<List<WordModel>>.internal(
  allWords,
  name: r'allWordsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allWordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllWordsRef = AutoDisposeFutureProviderRef<List<WordModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
