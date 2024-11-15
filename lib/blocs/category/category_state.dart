import 'package:equatable/equatable.dart';
import '../../models/article.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Article> articles;
  final String category;

  const CategoryLoaded({required this.articles, required this.category});

  @override
  List<Object?> get props => [articles, category];
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
