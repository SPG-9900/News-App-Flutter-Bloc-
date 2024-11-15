import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategoryArticles extends CategoryEvent {
  final String category;

  const LoadCategoryArticles(this.category);

  @override
  List<Object?> get props => [category];
}
