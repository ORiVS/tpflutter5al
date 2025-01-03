import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tpflutter5al/blocs/posts_bloc/posts_bloc.dart';
import 'post_detail_screen.dart';
import 'create_post_screen.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<PostsBloc>(context).add(const GetAllPosts());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.status) {
            case PostsStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostsStatus.success:
              final posts = state.posts;
              if (posts.isEmpty) {
                return const Center(child: Text('No posts available.'));
              }
              return ListView.separated(
                itemCount: posts.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PostDetailScreen(post: post),
                        ),
                      );
                    },
                  );
                },
              );
            case PostsStatus.error:
              return Center(
                child: Text(state.errorMessage ?? 'An error occurred.'),
              );
            case PostsStatus.initial:
            default:
              return const Center(child: Text('Welcome to the Posts App!'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreatePostScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
