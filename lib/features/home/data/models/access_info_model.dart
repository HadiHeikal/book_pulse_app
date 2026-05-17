import 'package:book_pulse_app/features/home/data/models/epub_model.dart';
import 'package:book_pulse_app/features/home/data/models/pdf_model.dart';

class AccessInfo {
  String country;
  String viewability;
  bool embeddable;
  bool publicDomain;
  String textToSpeechPermission;
  Epub epub;
  Pdf pdf;
  String webReaderLink;
  String accessViewStatus;
  bool quoteSharingAllowed;

  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  AccessInfo copyWith({
    String? country,
    String? viewability,
    bool? embeddable,
    bool? publicDomain,
    String? textToSpeechPermission,
    Epub? epub,
    Pdf? pdf,
    String? webReaderLink,
    String? accessViewStatus,
    bool? quoteSharingAllowed,
  }) => AccessInfo(
    country: country ?? this.country,
    viewability: viewability ?? this.viewability,
    embeddable: embeddable ?? this.embeddable,
    publicDomain: publicDomain ?? this.publicDomain,
    textToSpeechPermission:
        textToSpeechPermission ?? this.textToSpeechPermission,
    epub: epub ?? this.epub,
    pdf: pdf ?? this.pdf,
    webReaderLink: webReaderLink ?? this.webReaderLink,
    accessViewStatus: accessViewStatus ?? this.accessViewStatus,
    quoteSharingAllowed: quoteSharingAllowed ?? this.quoteSharingAllowed,
  );
  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(
      country: json['country'] ?? 'N/A',
      viewability: json['viewability'] ?? 'NO_VIEW',
      embeddable: json['embeddable'] ?? false,
      publicDomain: json['publicDomain'] ?? false,
      textToSpeechPermission: json['textToSpeechPermission'] ?? 'UNKNOWN',
      // الـ epub والـ pdf ممكن يكونوا null في some books
      epub: json['epub'] != null
          ? Epub.fromJson(json['epub'] as Map<String, dynamic>)
          : Epub(isAvailable: false, acsTokenLink: ''),
      pdf: json['pdf'] != null
          ? Pdf.fromJson(json['pdf'] as Map<String, dynamic>)
          : Pdf(isAvailable: false, downloadLink: ''),
      webReaderLink: json['webReaderLink'] ?? '',
      accessViewStatus: json['accessViewStatus'] ?? 'NONE',
      quoteSharingAllowed: json['quoteSharingAllowed'] ?? false,
    );
  }
}
