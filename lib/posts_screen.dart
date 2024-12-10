import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'posts_bloc/posts_bloc.dart';
import '../models/post.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          // Vérifier l'état des posts
          if (state is PostsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsErrorState) {
            return Center(child: Text(state.message));
          } else if (state is PostsLoadedState) {
            final posts = state.posts; // Récupération de la liste des posts

            return RefreshIndicator(
              onRefresh: () async => _getAllPosts(context), // Fonction de rafraîchissement
              child: ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                    onTap: () {
                      // Naviguer vers une page de détails ou d'édition de post si nécessaire
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('No posts available'));
          }
        },
      ),
    );
  }

  // Fonction pour récupérer tous les posts
  void _getAllPosts(BuildContext context) {
    final postsBloc = BlocProvider.of<PostsBloc>(context);
    postsBloc.add(const GetAllPosts());
  }
}
