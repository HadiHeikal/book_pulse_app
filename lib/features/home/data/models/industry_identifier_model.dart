class IndustryIdentifier {
  String type;
  String identifier;

  IndustryIdentifier({required this.type, required this.identifier});

  IndustryIdentifier copyWith({String? type, String? identifier}) =>
      IndustryIdentifier(
        type: type ?? this.type,
        identifier: identifier ?? this.identifier,
      );
}
