part of 'posts_bloc.dart';

enum PostsStatus {
  initial,  // État initial
  loading,  // Chargement en cours
  success,  // Succès de récupération ou modification
  error,    // Erreur rencontrée
}

class PostsState {
  final PostsStatus status;      // Statut de l'état
  final List<Post> posts;        // Liste des posts
  final String? errorMessage;    // Message d'erreur

  const PostsState({
    this.status = PostsStatus.initial,
    this.posts = const [],
    this.errorMessage,
  });

  // Méthode immuable pour créer une nouvelle instance de l'état
  PostsState copyWith({
    PostsStatus? status,
    List<Post>? posts,
    String? errorMessage,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
