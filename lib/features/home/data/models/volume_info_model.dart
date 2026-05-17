import 'package:book_pulse_app/features/home/data/models/image_link_model.dart';
import 'package:book_pulse_app/features/home/data/models/industry_identifier_model.dart';
import 'package:book_pulse_app/features/home/data/models/panelization_summary_model.dart';
import 'package:book_pulse_app/features/home/data/models/reading_modes_model.dart';

class VolumeInfo {
  String title;
  List<String> authors;
  String publishedDate;
  List<IndustryIdentifier> industryIdentifiers;
  ReadingModes readingModes;
  int pageCount;
  String printType;
  List<String> categories;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;

  VolumeInfo({
    required this.title,
    required this.authors,
    required this.publishedDate,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  VolumeInfo copyWith({
    String? title,
    List<String>? authors,
    String? publishedDate,
    List<IndustryIdentifier>? industryIdentifiers,
    ReadingModes? readingModes,
    int? pageCount,
    String? printType,
    List<String>? categories,
    String? maturityRating,
    bool? allowAnonLogging,
    String? contentVersion,
    PanelizationSummary? panelizationSummary,
    ImageLinks? imageLinks,
    String? language,
    String? previewLink,
    String? infoLink,
    String? canonicalVolumeLink,
  }) => VolumeInfo(
    title: title ?? this.title,
    authors: authors ?? this.authors,
    publishedDate: publishedDate ?? this.publishedDate,
    industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
    readingModes: readingModes ?? this.readingModes,
    pageCount: pageCount ?? this.pageCount,
    printType: printType ?? this.printType,
    categories: categories ?? this.categories,
    maturityRating: maturityRating ?? this.maturityRating,
    allowAnonLogging: allowAnonLogging ?? this.allowAnonLogging,
    contentVersion: contentVersion ?? this.contentVersion,
    panelizationSummary: panelizationSummary ?? this.panelizationSummary,
    imageLinks: imageLinks ?? this.imageLinks,
    language: language ?? this.language,
    previewLink: previewLink ?? this.previewLink,
    infoLink: infoLink ?? this.infoLink,
    canonicalVolumeLink: canonicalVolumeLink ?? this.canonicalVolumeLink,
  );
}
