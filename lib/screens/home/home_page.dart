import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocs/home/home_event.dart';
import 'package:news/blocs/home/home_state.dart';
import '../../blocs/home/home_bloc.dart';
import '../../widgets/loading_indicator.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadCategories());

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const LoadingIndicator();
          } else if (state is HomeLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return Card(
                  child: ListTile(
                    title: Text(category),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => context.push('/category/$category'),
                  ),
                );
              },
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
