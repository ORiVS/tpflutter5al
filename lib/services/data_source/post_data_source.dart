import '../../models/post.dart';

abstract class PostDataSource {
  Future<List<Post>> getAllPosts();
  Future<Post> createPost(Post post);
  Future<Post> updatePost(Post post);
}
