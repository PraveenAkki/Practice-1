# Bloc Demo App

This repository is a Flutter demo app built to practice and demonstrate different state management patterns using BLoC and `flutter_bloc`.

It contains multiple small examples inside one app, making it useful for learning how to structure a Flutter project with reusable bloc logic, repositories, and screens.

## Features

- Counter example
- Switch toggle example
- Image picker example
- Todo list management
- Favorite items app
- Post listing using a repository/API pattern
- Login screen example

## Tech Stack

- Flutter
- Dart
- Bloc
- flutter_bloc
- equatable
- http
- image_picker

## Project Structure

- `lib/main.dart` – app entry point
- `lib/app.dart` – app setup and global bloc providers
- `lib/bloc/` – BLoC implementations for each feature
- `lib/view/` – UI screens and widgets
- `lib/repository/` – data access and repository logic
- `lib/models/` – model classes
- `lib/utils/` – shared helpers and utilities
- `test/` – project tests

## Getting Started

### Prerequisites

Make sure you have Flutter installed and configured on your machine.

```bash
flutter --version
```

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

## Common Commands

```bash
flutter analyze
flutter test
flutter run
```

## Notes

This project is intended as a learning/demo app. The app uses a `MultiBlocProvider` to register several feature-specific blocs globally, and each screen is designed to showcase a different use case of state management in Flutter.

## License

This project is for educational/demo purposes.
