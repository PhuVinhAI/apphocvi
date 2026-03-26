# Vocabulary Feature Redesign - TODO

## Phase 1: Theme System ✅
- [x] Create design tokens (colors, spacing, typography, radius)
- [x] Create MixScope wrapper with theme
- [x] Create reusable component styles (cards, buttons, headers)
- [x] Refactor vocabulary_list_screen với theme mới

## Phase 2: File Structure & Learning Flow Design
- [x] Tạo vocabulary_detail_screen (word overview + start learning button)
- [x] Tạo flashcard_learning_screen (swipeable flashcards)
- [x] Tạo example_sentences_screen (sentences với audio)
- [x] Tạo quiz_multi_choice_screen
- [x] Tạo quiz_fill_blank_screen
- [x] Tạo learning_complete_screen (summary + progress)

## Phase 3: Learning Flow State Management
- [ ] Create learning_session_provider (track current word, progress)
- [ ] Create audio_player_provider (play example sentences)
- [ ] Create quiz_state_provider (track answers, score)

## Phase 4: Navigation & Integration
- [ ] Update router với routes mới
- [ ] Implement navigation flow: List → Detail → Flashcard → Examples → Quizzes → Complete
- [ ] Add back navigation và progress indicator
- [ ] Test complete flow end-to-end

## Learning Flow Design:
1. **List Screen** (hiện tại) - Browse words by level/topic
2. **Detail Screen** - Xem chi tiết từ (definition, examples, notes) + "Start Learning" button
3. **Flashcard Screen** - Swipe cards, flip để xem definition
4. **Example Sentences** - Đọc câu ví dụ, play audio (Northern/Southern)
5. **Multi-Choice Quiz** - Chọn đáp án đúng
6. **Fill Blank Quiz** - Điền từ vào chỗ trống
7. **Complete Screen** - Summary, score, "Learn Next Word" button

## Notes
- Using pure Flutter for all styling ✅ (Mix 2.0 removed)
- Following Clean Architecture pattern
- Data structure remains unchanged (WordModel)
- Focus on minimal, clean UI
