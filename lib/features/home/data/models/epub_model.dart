class Epub {
  bool isAvailable;
  String downloadLink;

  Epub({required this.isAvailable, required this.downloadLink});

  Epub copyWith({bool? isAvailable, String? downloadLink}) => Epub(
    isAvailable: isAvailable ?? this.isAvailable,
    downloadLink: downloadLink ?? this.downloadLink,
  );
}
