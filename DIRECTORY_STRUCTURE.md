# Project Directory Structure

This document outlines the folder architecture for the **apphocvi** (Vietnamese Learning App) Flutter project. The project follows a **Feature-Driven (Modular) Architecture** using `Riverpod` for state management, `GoRouter` for navigation, and `Freezed` for data modeling.

## Directory Tree

```text
apphocvi/
├── assets/                             # Static assets (Local database & Media)
│   └── data/
│       ├── master_vocab.json           # Master index/list of all vocabulary
│       ├── Level_1/                    # Categorized by difficulty level
│       │   ├── Topic_1_Pronouns/       # Categorized by topic
│       │   │   ├── 0003_mình/          # Individual word folder
│       │   │   │   ├── data.json       # Word definitions, quizzes, and metadata
│       │   │   │   ├── flashcard.mp3   # Audio for flashcard
│       │   │   │   ├── fill_blank.mp3  # Audio for fill-in-the-blank quiz
│       │   │   │   ├── northern_*.mp3  # Northern accent audio examples
│       │   │   │   └── southern_*.mp3  # Southern accent audio examples
│       │   │   ├── 0007_nó/            # (Pattern repeats for each word...)
│       │   │   └── ...
│       │   ├── Topic_2_States_Ownership/
│       │   └── Topic_3_Basic_Actions/
│       └── Level_2/
│           └── Topic_4_Time_Connectors/
│
├── lib/                                # Main Dart source code
│   ├── core/                           # Core app configurations and shared UI
│   │   ├── presentation/
│   │   │   └── screens/
│   │   │       └── main_layout_screen.dart # Main layout with Bottom Navigation Bar
│   │   └── router/
│   │       └── app_router.dart         # GoRouter configuration
│   │
│   ├── features/                       # Feature-based modules
│   │   ├── profile/                    # User Profile feature
│   │   │   └── presentation/
│   │   │       └── screens/
│   │   │           └── profile_screen.dart # Profile UI
│   │   │
│   │   └── vocabulary/                 # Vocabulary Learning feature
│   │       ├── data/
│   │       │   ├── models/
│   │       │   │   ├── word_model.dart          # Word data model
│   │       │   │   ├── word_model.freezed.dart  # Freezed generated code
│   │       │   │   └── word_model.g.dart        # JSON Serializable generated code
│   │       │   └── repositories/
│   │       │       ├── vocabulary_repository.dart   # Logic to fetch/parse JSON assets
│   │       │       └── vocabulary_repository.g.dart # Riverpod generator code
│   │       └── presentation/
│   │           └── screens/
│   │               └── test_vocab_screen.dart # Vocabulary listing and testing UI
│   │
│   └── main.dart                       # Application entry point
│
├── android/                            # Android native build configurations
├── ios/                                # iOS native build configurations
├── macos/                              # macOS desktop build configurations
├── linux/                              # Linux desktop build configurations
├── windows/                            # Windows desktop build configurations
├── web/                                # Web build configurations
│
├── pubspec.yaml                        # Flutter project configuration and dependencies
├── analysis_options.yaml               # Dart linting and static analysis rules
└── README.md                           # Project documentation
```

## Key Architectural Notes

1. **`lib/features/`**: The app is strictly divided into features (currently `profile` and `vocabulary`). Each feature encapsulates its own Data layer (`models`, `repositories`) and Presentation layer (`screens`, `widgets`).
2. **`lib/core/`**: Contains global elements that do not belong to a specific feature, such as the application routing (`app_router.dart`) and the global application shell (`main_layout_screen.dart`).
3. **`assets/data/`**: Acts as a local, offline database. It utilizes a highly structured directory tree where each vocabulary word has its own dedicated folder containing its localized JSON data and region-specific MP3 audio files.
```