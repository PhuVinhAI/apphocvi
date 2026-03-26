// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vocabularyRepository)
final vocabularyRepositoryProvider = VocabularyRepositoryProvider._();

final class VocabularyRepositoryProvider
    extends
        $FunctionalProvider<
          VocabularyRepository,
          VocabularyRepository,
          VocabularyRepository
        >
    with $Provider<VocabularyRepository> {
  VocabularyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vocabularyRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vocabularyRepositoryHash();

  @$internal
  @override
  $ProviderElement<VocabularyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VocabularyRepository create(Ref ref) {
    return vocabularyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VocabularyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VocabularyRepository>(value),
    );
  }
}

String _$vocabularyRepositoryHash() =>
    r'e067fec27a7a9bd018a8c125f56e7d29dc0b8975';

@ProviderFor(allWords)
final allWordsProvider = AllWordsProvider._();

final class AllWordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WordModel>>,
          List<WordModel>,
          FutureOr<List<WordModel>>
        >
    with $FutureModifier<List<WordModel>>, $FutureProvider<List<WordModel>> {
  AllWordsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allWordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allWordsHash();

  @$internal
  @override
  $FutureProviderElement<List<WordModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WordModel>> create(Ref ref) {
    return allWords(ref);
  }
}

String _$allWordsHash() => r'13f7962a6b3a4da83e3bcf08aaaa7477f60fb4a1';

@ProviderFor(groupedWords)
final groupedWordsProvider = GroupedWordsProvider._();

final class GroupedWordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, Map<String, List<WordModel>>>>,
          Map<String, Map<String, List<WordModel>>>,
          FutureOr<Map<String, Map<String, List<WordModel>>>>
        >
    with
        $FutureModifier<Map<String, Map<String, List<WordModel>>>>,
        $FutureProvider<Map<String, Map<String, List<WordModel>>>> {
  GroupedWordsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupedWordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupedWordsHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, Map<String, List<WordModel>>>>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, Map<String, List<WordModel>>>> create(Ref ref) {
    return groupedWords(ref);
  }
}

String _$groupedWordsHash() => r'27cf93b9a8984b63c67ed97b1eed5472f7e00cba';
