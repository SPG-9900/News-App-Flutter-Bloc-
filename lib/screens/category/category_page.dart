import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocs/category/category_event.dart';
import 'package:news/blocs/category/category_state.dart';
import '../../blocs/category/category_bloc.dart';
import '../../widgets/article_card.dart';
import '../../widgets/loading_indicator.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(LoadCategoryArticles(category));

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const LoadingIndicator();
          } else if (state is CategoryLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return ArticleCard(
                  article: article,
                  onTap: () => context.push('/article/${article.id}'),
                );
              },
            );
          } else if (state is CategoryError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
