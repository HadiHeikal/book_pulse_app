const String baseUrl = "https://www.googleapis.com/books/v1";
const String apiKey = "AIzaSyB0jcyG_7AlJ-pQpV_ttjrIx4QLCYwDBV4";

const String searchFreeNewestBooksEndpoint =
    "/volumes?Filtering=free-ebooks&sorting=newest&q=programming&key=$apiKey";

const String searchFeaturedBooksEndpoint =
    "/volumes?Filtering=free-ebooks&q=programming&key=$apiKey";

const String searchBestSellerBooksEndpoint =
    "/volumes?Filtering=free-ebooks&orderBy=relevance&q=fiction&key=$apiKey";

const String searchTopRatedBooksEndpoint =
    "/volumes?Filtering=free-ebooks&q=subject:science&key=$apiKey";
