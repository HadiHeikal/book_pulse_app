class SaleInfo {
  String country;
  String saleability;
  bool isEbook;
  String buyLink;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
    required this.buyLink,
  });

  SaleInfo copyWith({
    String? country,
    String? saleability,
    bool? isEbook,
    String? buyLink,
  }) => SaleInfo(
    country: country ?? this.country,
    saleability: saleability ?? this.saleability,
    isEbook: isEbook ?? this.isEbook,
    buyLink: buyLink ?? this.buyLink,
  );
}
