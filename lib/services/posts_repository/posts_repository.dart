import '../../models/post.dart';
import '../data_source/post_data_source.dart';

class PostRepository {
  final PostDataSource dataSource;

  PostRepository({required this.dataSource});

  Future<List<Post>> getAllPosts() async {
    return await dataSource.getAllPosts();
  }

  Future<Post> createPost(Post post) async {
    return await dataSource.createPost(post);
  }

  Future<Post> updatePost(Post post) async {
    return await dataSource.updatePost(post);
  }
}