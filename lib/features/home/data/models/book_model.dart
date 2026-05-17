import 'package:book_pulse_app/features/home/data/models/access_info_model.dart';
import 'package:book_pulse_app/features/home/data/models/sales_info.dart';
import 'package:book_pulse_app/features/home/data/models/search_info_model.dart';
import 'package:book_pulse_app/features/home/data/models/volume_info_model.dart';
import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String description;
  final double price;
  final double rating;
  final int ratingCount;
  final double readingProgress;
  final String genre;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  const BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.description,
    this.price = 0.0,
    this.rating = 0.0,
    this.ratingCount = 0,
    this.readingProgress = 0.0,
    this.genre = '',
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  // 👇 ضيف الـ factory الميثود دي جوه الكلاس عشان الإيرور يختفي
  factory BookModel.fromJson(Map<String, dynamic> json) {
    // استخراج الـ volumeInfo بشكل منفصل لتسهيل قراءة الـ لستة والـ title والـ authors
    final volumeInfoJson = json['volumeInfo'] as Map<String, dynamic>?;

    return BookModel(
      id: json['id'] as String? ?? '',
      // الـ title والـ authors والـ cover غالباً بيبقوا جوه الـ volumeInfo في Google Books API
      title:
          volumeInfoJson?['title'] as String? ??
          json['title'] as String? ??
          'No Title',
      author:
          (volumeInfoJson?['authors'] as List<dynamic>?)?.first as String? ??
          json['author'] as String? ??
          'Unknown Author',
      coverUrl:
          volumeInfoJson?['imageLinks']?['thumbnail'] as String? ??
          json['coverUrl'] as String? ??
          '',
      description:
          volumeInfoJson?['description'] as String? ??
          json['description'] as String? ??
          '',

      // معالجة الأرقام بشكل آمن لمنع الـ Type cast exception (int to double)
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating:
          (volumeInfoJson?['averageRating'] as num?)?.toDouble() ??
          (json['rating'] as num?)?.toDouble() ??
          0.0,
      ratingCount:
          volumeInfoJson?['ratingsCount'] as int? ??
          json['ratingCount'] as int? ??
          0,
      readingProgress: (json['readingProgress'] as num?)?.toDouble() ?? 0.0,
      genre: json['genre'] as String? ?? '',

      // الـ Sub-Models بتاعتك (تأكد إن جواههم من برضه من وجود .fromJson)
      volumeInfo: volumeInfoJson != null
          ? VolumeInfo.fromJson(volumeInfoJson)
          : null,
      saleInfo: json['saleInfo'] != null
          ? SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>)
          : null,
      accessInfo: json['accessInfo'] != null
          ? AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>)
          : null,
      searchInfo: json['searchInfo'] != null
          ? SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    author,
    coverUrl,
    description,
    price,
    rating,
    ratingCount,
    readingProgress,
    genre,
    volumeInfo,
    saleInfo,
    accessInfo,
    searchInfo,
  ];
}
