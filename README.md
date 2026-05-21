# BookPulse

A Flutter app for discovering and browsing free ebooks. BookPulse pulls live data from the [Google Books API](https://developers.google.com/books) and presents curated lists—featured picks, newest releases, top-rated titles, and bestsellers—in a dark, reader-focused UI.

Built with the **MVVM** (Model–View–ViewModel) architecture pattern for clear separation of UI, business logic, and data.

## Features

- **Splash & onboarding** — First-launch walkthrough with persistent onboarding state
- **Home feed** — Featured books, continue reading, top rated, and bestseller sections
- **Book details** — Cover, ratings, description, and related titles
- **MVVM + Cubit** — ViewModels (`Cubit`) expose UI state; Views react via `BlocBuilder` / `BlocProvider`
- **Navigation** — Declarative routing with `go_router`

## Architecture (MVVM)

| Layer | Role in BookPulse | Location |
|-------|-------------------|----------|
| **Model** | Data models, API calls, repositories | `features/*/data/` |
| **View** | Screens and widgets (UI only) | `features/*/presentation/views/` |
| **ViewModel** | Presentation logic and UI state | `features/*/presentation/viewmodels/` |

ViewModels are implemented as **Cubits** (`flutter_bloc`). Each Cubit talks to a repository, emits loading/success/error states, and keeps Views free of business logic.

```
View  →  ViewModel (Cubit)  →  Repository  →  API / Models
```

## Tech stack

| Layer | Tools |
|-------|--------|
| UI | Flutter, Material (dark theme) |
| MVVM / state | `flutter_bloc` (Cubit as ViewModel), `equatable` |
| Networking | `dio` |
| DI | `get_it` |
| Routing | `go_router` |
| Storage | `shared_preferences` |

## Project structure

```
lib/
├── core/           # Colors, styles, API client, shared utilities
├── features/
│   ├── splash/
│   ├── onboarding/
│   └── home/       # data (Model), viewmodels (ViewModel), views (View)
├── routes/         # App routes and GoRouter configuration
└── main.dart
```

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart `^3.11.4` per `pubspec.yaml`)
- A [Google Books API key](https://developers.google.com/books/docs/v1/using#APIKey)

## Getting started

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd book_pulse_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure the API key**

   Add your Google Books API key in `lib/core/constants/app_strings.dart`:

   ```dart
   const String apiKey = "YOUR_API_KEY_HERE";
   ```

4. **Run the app**

   ```bash
   flutter run
   ```

## Supported platforms

Android · iOS · Web · Windows · macOS · Linux

## License

This project is for educational purposes. See the repository owner for licensing details.
