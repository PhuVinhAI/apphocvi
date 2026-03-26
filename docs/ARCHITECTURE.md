# Architecture Documentation

## Project Structure

```
lib/
├── core/                           # Core functionality
│   ├── constants/                  # App constants
│   ├── errors/                     # Error handling
│   ├── presentation/
│   │   └── screens/
│   │       └── main_layout_screen.dart  # Bottom navigation layout
│   ├── router/
│   │   └── app_router.dart        # GoRouter configuration
│   ├── theme/                      # Design system (Flutter thuần)
│   │   ├── app_tokens.dart        # Design tokens (colors, spacing, typography, radius)
│   │   └── app_styles.dart        # Reusable component styles
│   └── utils/                      # Utility functions
│
├── features/                       # Feature modules
│   ├── learning_path/             # Learning path feature
│   ├── practice/                   # Practice mode
│   │   └── presentation/
│   │       └── screens/
│   │           └── practice_screen.dart
│   ├── profile/                    # User profile
│   │   └── presentation/
│   │       └── screens/
│   │           └── profile_screen.dart
│   ├── quiz/                       # Quiz feature
│   └── vocabulary/                 # Vocabulary learning
│       ├── data/
│       │   ├── models/
│       │   │   ├── word_model.dart
│       │   │   ├── word_model.freezed.dart
│       │   │   └── word_model.g.dart
│       │   └── repositories/
│       │       ├── vocabulary_repository.dart
│       │       └── vocabulary_repository.g.dart
│       ├── domain/
│       │   ├── entities/
│       │   └── repositories/
│       └── presentation/
│           ├── controllers/
│           └── screens/
│               └── vocabulary_list_screen.dart
│
├── shared/                         # Shared widgets
│   └── widgets/
│
└── main.dart                       # App entry point

assets/
└── data/                          # Vocabulary data
    └── Level_1/
        └── Topic_1_Pronouns/
            └── 0003_mình/
                ├── data.json      # Word data with flashcard, quizzes, examples
                ├── flashcard.mp3
                ├── fill_blank.mp3
                ├── multi_choice.mp3
                ├── northern_1.mp3
                ├── northern_2.mp3
                ├── northern_3.mp3
                ├── southern_1.mp3
                ├── southern_2.mp3
                └── southern_3.mp3
```

## Architecture Pattern

### Clean Architecture
- **Presentation Layer**: UI components (screens, widgets)
- **Domain Layer**: Business logic, entities
- **Data Layer**: Data sources, repositories, models

### State Management
- **Riverpod**: For state management and dependency injection
- **Riverpod Generator** (`@riverpod`): Code generation cho providers

### Routing
- **GoRouter**: Declarative routing with StatefulShellRoute for bottom navigation

### Data Models
- **Freezed**: Immutable data classes với code generation
- **JSON Serializable**: Tự động parse JSON

## Theme System (Flutter thuần)

### Design Tokens (`app_tokens.dart`)
Centralized design tokens dùng plain Dart constants:

```dart
// Color tokens — static const Color
AppTokens.primary        // Color(0xFF2563EB)
AppTokens.primaryLight   // Color(0xFF60A5FA)
AppTokens.primaryDark    // Color(0xFF1E40AF)
AppTokens.surface        // Colors.white
AppTokens.background     // Color(0xFFF1F5F9)
AppTokens.textPrimary    // Color(0xFF0F172A)
AppTokens.textSecondary  // Color(0xFF475569)
AppTokens.textTertiary   // Color(0xFF94A3B8)

// Space tokens — static const double
AppTokens.spaceXs  // 4.0
AppTokens.spaceSm  // 8.0
AppTokens.spaceMd  // 16.0
AppTokens.spaceLg  // 24.0
AppTokens.spaceXl  // 32.0
AppTokens.space2xl // 48.0

// Radius tokens — static const double
AppTokens.radiusSm   // 4.0
AppTokens.radiusMd   // 8.0
AppTokens.radiusLg   // 12.0
AppTokens.radiusXl   // 16.0
AppTokens.radiusFull // 9999.0

// Typography tokens — static const TextStyle
AppTokens.textXs   // 12px
AppTokens.textSm   // 14px
AppTokens.textBase // 16px
AppTokens.textLg   // 18px
AppTokens.textXl   // 20px
AppTokens.text2xl  // 24px
AppTokens.text3xl  // 30px
```

### Component Styles (`app_styles.dart`)
Reusable styles trả về Flutter types:

```dart
// Cards — trả về BoxDecoration
AppStyles.card()
AppStyles.vocabCard()

// Typography — trả về TextStyle
AppStyles.h1()
AppStyles.h2()
AppStyles.h3()
AppStyles.body()
AppStyles.bodySecondary()
AppStyles.caption()
AppStyles.label()
```

### Usage Example

```dart
// Tokens dùng trực tiếp trong Flutter widgets
Container(
  padding: const EdgeInsets.all(AppTokens.spaceMd),
  decoration: BoxDecoration(
    color: AppTokens.surface,
    borderRadius: BorderRadius.circular(AppTokens.radiusLg),
  ),
  child: content,
)

// Component styles
Container(
  decoration: AppStyles.card(),
  child: content,
)

// Typography
Text('Hello', style: AppStyles.h1())

// Extend từ token
Text('Detail', style: AppTokens.textSm.copyWith(
  color: AppTokens.textSecondary,
  fontWeight: FontWeight.w500,
))
```

## Navigation Structure

### Bottom Navigation (3 tabs)
1. **Learn** (`/vocab`) - Vocabulary list and learning
2. **Practice** (`/practice`) - Practice exercises (placeholder)
3. **Profile** (`/profile`) - User profile (placeholder)

### Route Configuration
```dart
StatefulShellRoute.indexedStack(
  branches: [
    StatefulShellBranch(routes: [GoRoute(path: '/vocab')]),
    StatefulShellBranch(routes: [GoRoute(path: '/practice')]),
    StatefulShellBranch(routes: [GoRoute(path: '/profile')]),
  ],
)
```

## Data Structure

### Word Model
```dart
WordModel {
  String id
  String word
  int rank
  String level
  String topic
  String definition
  String notes
  String notesMd
  List<String> choices
  List<String> exampleSentences
  List<String> exampleSentencesTranslated
  List<String> sentenceBreakdowns
  List<String> exampleSentencesAudioUrls
  List<String> exampleSentencesAudioUrlsNorthern
  Map<String, dynamic> flashcard
  Map<String, dynamic> multiChoiceQuiz
  Map<String, dynamic> fillBlankQuiz
}
```

## Key Dependencies

| Package | Purpose |
|---|---|
| `flutter_riverpod` | State management |
| `riverpod_annotation` | Riverpod code generation |
| `go_router` | Declarative routing |
| `freezed_annotation` | Immutable data models |
| `json_annotation` | JSON serialization |
| `google_fonts` | Typography |
| `lucide_icons` | Icon set |
| `flutter_animate` | Animations |
| `equatable` | Value equality |
| `path_provider` | File system paths |

## Key Features

### Implemented
- ✅ Design token system (Flutter thuần)
- ✅ Reusable component styles (BoxDecoration, TextStyle)
- ✅ Bottom navigation with 3 tabs
- ✅ Vocabulary list screen (grouped by level/topic)
- ✅ Vocabulary data loading from bundled JSON assets
- ✅ Horizontal scrolling vocab cards

### Planned
- 🔄 Vocabulary detail screen
- 🔄 Flashcard learning mode
- 🔄 Example sentences with audio playback
- 🔄 Multi-choice quiz
- 🔄 Fill-blank quiz
- 🔄 Learning progress tracking
- 🔄 Practice mode implementation
- 🔄 User profile features

## Styling Guidelines

1. Dùng Flutter widgets tiêu chuẩn (`Container`, `Text`, `Icon`, `Column`, `Row`, etc.)
2. Luôn dùng `AppTokens` cho colors, spacing, radius — không hardcode giá trị rải rác
3. Dùng `AppStyles` cho các component styles lặp lại (card, typography)
4. Extend từ token bằng `.copyWith()` khi cần tuỳ chỉnh thêm
5. Dùng `AnimatedContainer` cho transition animations
6. Dùng `GestureDetector` hoặc `InkWell` cho interactive elements
