import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/vocabulary_repository.dart';

class TestVocabScreen extends ConsumerWidget {
  const TestVocabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsAsync = ref.watch(allWordsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Vocabulary Data'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(allWordsProvider),
          )
        ],
      ),
      body: wordsAsync.when(
        data: (words) {
          if (words.isEmpty) {
            return const Center(child: Text('No words found in assets/data.'));
          }

          return ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              final word = words[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(word.rank.toString()),
                ),
                title: Text(word.word),
                subtitle: Text('${word.topic} - ${word.level}\n${word.definition}'),
                isThreeLine: true,
                trailing: const Icon(Icons.bug_report),
                onTap: () {
                  final jsonString = const JsonEncoder.withIndent('  ').convert(word.toJson());
                  debugPrint('========== LOG WORD: ${word.word} ==========');
                  debugPrint(jsonString);
                  debugPrint('=============================================');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Printed JSON for "${word.word}" to console!')),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading data: $error'),
        ),
      ),
    );
  }
}