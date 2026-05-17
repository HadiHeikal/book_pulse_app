class Pdf {
  bool isAvailable;

  Pdf({required this.isAvailable});

  Pdf copyWith({bool? isAvailable}) =>
      Pdf(isAvailable: isAvailable ?? this.isAvailable);
}
