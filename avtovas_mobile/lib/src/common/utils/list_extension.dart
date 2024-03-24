extension ListExtension<T> on List<T> {
  List<T> insertBetween(T separator) {
    if (length <= 1) return List.of(this);

    return <T>[
      ...map((item) => [item, separator]).expand((pair) => pair).toList()
        ..removeLast(),
    ];
  }

  List<String> filterSimilarStrings(String input) {
    final inputStrings = this as List<String>;

    final filteredStrings = inputStrings
        .where((str) => _hasCommonWords(input, str) && str != input)
        .toList();

    return filteredStrings;
  }

  bool _hasCommonWords(String str1, String str2) {
    final words1 = str1.split(' ');
    final words2 = str2.split(' ');

    var commonCount = 0;
    final seenWords = <String>{};

    for (final word1 in words1) {
      for (final word2 in words2) {
        if (word1 == word2 && !seenWords.contains(word1)) {
          seenWords.add(word1);
          commonCount++;
          if (commonCount >= 2) {
            return true;
          }
        }
      }
    }
    return false;
  }
}
