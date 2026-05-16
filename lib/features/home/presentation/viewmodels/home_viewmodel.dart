import 'package:book_pulse_app/features/home/data/models/book_model.dart';

class HomeViewModel {
  final List<BookModel> featuredBooks = const [
    BookModel(
      id: '1',
      title: 'The Jungle Book',
      author: 'Rudyard Kipling',
      coverUrl: 'https://covers.openlibrary.org/b/id/8397944-L.jpg',
      description:
          'A timeless classic set in an Indian jungle, following the boy Mowgli raised by wolves.',
      price: 19.99,
      rating: 4.8,
      ratingCount: 2390,
      genre: 'Classic',
    ),
    BookModel(
      id: '2',
      title: 'Dune',
      author: 'Frank Herbert',
      coverUrl: 'https://covers.openlibrary.org/b/id/8739161-L.jpg',
      description:
          'An epic tale of Paul Atreides on the desert planet Arrakis, the only source of the universe\'s most precious substance.',
      price: 24.99,
      rating: 4.9,
      ratingCount: 8420,
      genre: 'Sci-Fi',
    ),
    BookModel(
      id: '3',
      title: '1984',
      author: 'George Orwell',
      coverUrl: 'https://covers.openlibrary.org/b/id/8345116-L.jpg',
      description:
          'A harrowing vision of a totalitarian society and the man who dares to challenge it.',
      price: 14.99,
      rating: 4.7,
      ratingCount: 12050,
      genre: 'Dystopian',
    ),
    BookModel(
      id: '4',
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      coverUrl: 'https://covers.openlibrary.org/b/id/8432841-L.jpg',
      description:
          'The story of the fabulously wealthy Jay Gatsby and his obsessive love for Daisy Buchanan.',
      price: 12.99,
      rating: 4.6,
      ratingCount: 9820,
      genre: 'Classic',
    ),
  ];

  final List<BookModel> continueReadingBooks = const [
    BookModel(
      id: '5',
      title: 'Harry Potter & the Goblet of Fire',
      author: 'J.K. Rowling',
      coverUrl: 'https://covers.openlibrary.org/b/id/8234792-L.jpg',
      description: '',
      readingProgress: 0.75,
      genre: 'Fantasy',
    ),
    BookModel(
      id: '6',
      title: '1984',
      author: 'George Orwell',
      coverUrl: 'https://covers.openlibrary.org/b/id/8345116-L.jpg',
      description: '',
      readingProgress: 0.30,
      genre: 'Dystopian',
    ),
    BookModel(
      id: '7',
      title: 'Dune',
      author: 'Frank Herbert',
      coverUrl: 'https://covers.openlibrary.org/b/id/8739161-L.jpg',
      description: '',
      readingProgress: 0.55,
      genre: 'Sci-Fi',
    ),
  ];

  final BookModel topRatedBook = const BookModel(
    id: '8',
    title: 'The Hobbit',
    author: 'J.R.R. Tolkien',
    coverUrl: 'https://covers.openlibrary.org/b/id/11305468-L.jpg',
    description:
        'Bilbo Baggins, a comfort-loving hobbit, is swept into an epic quest to reclaim the lost Dwarf Kingdom of Erebor from the dragon Smaug.',
    price: 22.99,
    rating: 4.9,
    ratingCount: 15230,
    genre: 'Fantasy',
  );

  final List<BookModel> bestSellers = const [
    BookModel(
      id: '9',
      title: 'Harry Potter and the Goblet of Fire',
      author: 'J.K. Rowling',
      coverUrl: 'https://covers.openlibrary.org/b/id/8234792-L.jpg',
      description:
          'Harry Potter\'s fourth year at Hogwarts is marked by the Triwizard Tournament, a dangerous magical competition.',
      price: 19.99,
      rating: 4.8,
      ratingCount: 2390,
    ),
    BookModel(
      id: '10',
      title: 'The Jungle Book',
      author: 'Rudyard Kipling',
      coverUrl: 'https://covers.openlibrary.org/b/id/8397944-L.jpg',
      description:
          'A collection of stories set in an Indian jungle, featuring the boy Mowgli raised by wolves.',
      price: 19.99,
      rating: 4.8,
      ratingCount: 2390,
    ),
    BookModel(
      id: '11',
      title: 'Star Wars: Return of the Jedi',
      author: 'James Kahn',
      coverUrl: 'https://covers.openlibrary.org/b/id/39830-L.jpg',
      description:
          'The rebels mount a final assault on the Galactic Empire and Luke confronts Darth Vader.',
      price: 16.99,
      rating: 4.7,
      ratingCount: 1870,
    ),
    BookModel(
      id: '12',
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      coverUrl: 'https://covers.openlibrary.org/b/id/8810691-L.jpg',
      description:
          'A powerful story of racial injustice and moral growth seen through the eyes of young Scout Finch.',
      price: 15.99,
      rating: 4.9,
      ratingCount: 21400,
    ),
    BookModel(
      id: '13',
      title: 'Dune',
      author: 'Frank Herbert',
      coverUrl: 'https://covers.openlibrary.org/b/id/8739161-L.jpg',
      description:
          'An epic space opera set on the desert planet Arrakis, home of the precious spice melange.',
      price: 24.99,
      rating: 4.9,
      ratingCount: 8420,
    ),
  ];
}
