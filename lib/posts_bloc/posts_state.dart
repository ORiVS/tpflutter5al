part of 'posts_bloc.dart';

@immutable
sealed class PostsState {
  final List<Post> posts;

  const PostsState({this.posts = const []});
}

class PostsInitialState extends PostsState {
  const PostsInitialState() : super();
}

class PostsLoadingState extends PostsState {
  const PostsLoadingState() : super();
}

class PostsLoadedState extends PostsState {
  const PostsLoadedState(List<Post> posts) : super(posts: posts);
}

class PostsErrorState extends PostsState {
  final String message;

  const PostsErrorState(this.message) : super();
}
