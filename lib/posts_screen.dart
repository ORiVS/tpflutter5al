import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'posts_bloc/posts_bloc.dart';
import '../models/post.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Déclenche GetAllPosts juste après que l'écran est affiché
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getAllPosts(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          // Gestion des différents états
          if (state is PostsLoadingState) {
            // État de chargement
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsErrorState) {
            // État d'erreur
            return Center(child: Text(state.message));
          } else if (state is PostsLoadedState) {
            // État avec les posts chargés
            final posts = state.posts;
            print('PostsScreen: Loaded ${posts.length} posts');
            if (posts.isEmpty) {
              return const Center(child: Text('No posts available'));
            }

            return RefreshIndicator(
              onRefresh: () async => _getAllPosts(context),
              child: ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                    onTap: () {
                      // Naviguer vers une page de détails ou d'édition si nécessaire
                      print('Navigating to details of ${post.title}');
                    },
                  );
                },
              ),
            );
          } else {
            // État initial ou inconnu
            return const Center(child: Text('No posts available'));
          }
        },
      ),
    );
  }

  // Fonction pour récupérer tous les posts
  void _getAllPosts(BuildContext context) {
    print('PostsScreen: Triggering GetAllPosts event');
    final postsBloc = BlocProvider.of<PostsBloc>(context);
    postsBloc.add(const GetAllPosts());
  }
}
