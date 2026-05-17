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
  ];
}
