import '../../../categories/domain/entities/category.dart';

class HomeUiState {
  final List<Category> categories;
  final bool isLoading;

  HomeUiState({
    required this.isLoading,
    required this.categories,
  });

  HomeUiState.defaultObj()
      : this(
          categories: [],
          isLoading: false,
        );

  HomeUiState copyWith({
    List<Category>? categories,
    bool? isLoading,
  }) =>
      HomeUiState(
        categories: categories ?? this.categories,
        isLoading: isLoading ?? this.isLoading,
      );
}
