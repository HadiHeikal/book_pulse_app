class Pdf {
  bool isAvailable;

  Pdf({required this.isAvailable});

  Pdf copyWith({bool? isAvailable}) =>
      Pdf(isAvailable: isAvailable ?? this.isAvailable);
  factory Pdf.fromJson(Map<String, dynamic> json) {
    return Pdf(
      isAvailable: json['isAvailable'] as bool? ?? false,
      downloadLink: json['downloadLink'] as String? ?? '',
    );
  }
}
