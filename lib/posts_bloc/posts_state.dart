part of 'posts_bloc.dart';

enum PostsStatus {
  initial,
  loading,
  success,
  error,
}

@immutable
class PostsState {
  final PostsStatus status;
  final List<Post> posts;
  final String? errorMessage;

  const PostsState({
    this.status = PostsStatus.initial,
    this.posts = const [],
    this.errorMessage,
  });
}
