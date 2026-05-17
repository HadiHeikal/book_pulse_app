class SearchInfo {
  String textSnippet;

  SearchInfo({required this.textSnippet});

  SearchInfo copyWith({String? textSnippet}) =>
      SearchInfo(textSnippet: textSnippet ?? this.textSnippet);
  factory SearchInfo.fromJson(Map<String, dynamic> json) {
    return SearchInfo(textSnippet: json['textSnippet'] as String? ?? '');
  }
}
