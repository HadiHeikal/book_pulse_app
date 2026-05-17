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
}
