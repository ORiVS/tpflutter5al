import 'dart:async';
import '../models/post.dart';

class FakePostsDataSource {
  final List<Post> _fakePosts = [
    Post(id: 1, title: 'Post 1', description: 'Description of Post 1'),
    Post(id: 2, title: 'Post 2', description: 'Description of Post 2'),
    Post(id: 3, title: 'Post 3', description: 'Description of Post 3'),
  ];

  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts;
  }

  Future<void> createPost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    _fakePosts.add(post);
  }

  Future<void> updatePost(Post post) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _fakePosts.indexWhere((p) => p.id == post.id);
    if (index != -1) {
      _fakePosts[index] = post;
    }
  }
}
