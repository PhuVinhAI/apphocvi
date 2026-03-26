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
│   ├── theme/                      # Theme system (Mix 2.0)
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

### Routing
- **GoRouter**: Declarative routing with StatefulShellRoute for bottom navigation

## Theme System (Mix 2.0)

### Design Tokens (`app_tokens.dart`)
Centralized design tokens for consistent styling:

```dart
// Color tokens
AppTokens.primary
AppTokens.primaryLight
AppTokens.primaryDark
AppTokens.surface
AppTokens.background
AppTokens.textPrimary
AppTokens.textSecondary
AppTokens.textTertiary

// Space tokens
AppTokens.spaceXs  // 4px
AppTokens.spaceSm  // 8px
AppTokens.spaceMd  // 16px
AppTokens.spaceLg  // 24px
AppTokens.spaceXl  // 32px
AppTokens.space2xl // 48px

// Radius tokens
AppTokens.radiusSm   // 4px
AppTokens.radiusMd   // 8px
AppTokens.radiusLg   // 12px
AppTokens.radiusXl   // 16px
AppTokens.radiusFull // 9999px

// Typography tokens
AppTokens.textXs   // 12px
AppTokens.textSm   // 14px
AppTokens.textBase // 16px
AppTokens.textLg   // 18px
AppTokens.textXl   // 20px
AppTokens.text2xl  // 24px
AppTokens.text3xl  // 30px
```

### Component Styles (`app_styles.dart`)
Reusable component styles:

```dart
// Cards
AppStyles.card()
AppStyles.cardInteractive()
AppStyles.vocabCard()

// Buttons
AppStyles.buttonPrimary()
AppStyles.buttonSecondary()
AppStyles.iconButton()

// Typography
AppStyles.h1()
AppStyles.h2()
AppStyles.h3()
AppStyles.body()
AppStyles.bodySecondary()
AppStyles.caption()
AppStyles.label()

// Layout
AppStyles.screenPadding()
AppStyles.section()
```

### Usage Example

```dart
// Using tokens directly
final style = BoxStyler()
    .color(AppTokens.surface())
    .paddingAll(AppTokens.spaceMd())
    .borderRadiusAll(AppTokens.radiusLg());

// Using component styles
final cardStyle = AppStyles.card();
Box(style: cardStyle, child: content);

// Using typography
StyledText('Hello', style: AppStyles.h1());
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

## Key Features

### Implemented
- ✅ Theme system with Mix 2.0
- ✅ Design tokens for consistent styling
- ✅ Bottom navigation with 3 tabs
- ✅ Vocabulary list screen (grouped by level/topic)
- ✅ Vocabulary data loading from JSON
- ✅ Responsive card layout with hover effects

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

### Mix 2.0 Rules
1. Always use Mix widgets (Box, StyledText, StyledIcon) instead of Flutter primitives
2. Define styles as variables, not inline
3. Use tokens for all styling values (colors, spacing, etc.)
4. Tokens can only be used INSIDE Mix widgets, not Flutter widgets
5. For Flutter widgets (Scaffold, etc.), use hardcoded colors

### Example
```dart
// ✅ Correct - Mix widget with tokens
Box(
  style: BoxStyler()
      .color(AppTokens.surface())
      .paddingAll(AppTokens.spaceMd()),
  child: content,
)

// ❌ Wrong - Flutter widget with tokens
Scaffold(
  backgroundColor: AppTokens.background(), // Error!
)

// ✅ Correct - Flutter widget with hardcoded color
Scaffold(
  backgroundColor: const Color(0xFFF1F5F9),
)
```

## Development Notes

### Token Limitations
- ColorToken references cannot use `.withOpacity()` directly
- Must resolve tokens first or use hardcoded colors with alpha channel
- Example: `const Color(0x1F2563EB)` instead of `AppTokens.primary().withOpacity(0.12)`

### Animation Considerations
- Avoid scale/transform animations with Mix to prevent Matrix4Tween errors
- Prefer color and opacity animations
- Use `.animate(.easeInOut(250.ms))` for smooth transitions
