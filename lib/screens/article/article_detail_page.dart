import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocs/article/article_event.dart';
import 'package:news/blocs/article/article_state.dart';
import '../../blocs/article/article_bloc.dart';
import '../../widgets/loading_indicator.dart';
import 'package:share_plus/share_plus.dart';

class ArticleDetailPage extends StatelessWidget {
  final String articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  Widget build(BuildContext context) {
    // Trigger loading article when the page is built
    context.read<ArticleBloc>().add(LoadArticle(articleId));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              final state = context.read<ArticleBloc>().state;
              if (state is ArticleLoaded) {
                Share.share(
                  'Check out this article: ${state.article.title}\n'
                  'https://icicilombard.com/article/$articleId',
                );
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return const LoadingIndicator();
          } else if (state is ArticleLoaded) {
            final article = state.article;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      article.imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.description,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    article.content,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          } else if (state is ArticleError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
