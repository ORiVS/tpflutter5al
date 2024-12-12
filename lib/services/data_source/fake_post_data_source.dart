import 'dart:async';
import 'package:tpflutter5al/services/data_source/post_data_source.dart';
import 'post_data_source.dart';
import '../../models/post.dart';

class FakePostsDataSource extends PostDataSource {
  List<Post> _fakePosts = [
    Post(id: 1, title: 'Post 1', description: 'Description of Post 1'),
    Post(id: 2, title: 'Post 2', description: 'Description of Post 2'),
    Post(id: 3, title: 'Post 3', description: 'Description of Post 3'),
  ];

  @override
  Future<List<Post>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _fakePosts;
  }

  @override
  Future<Post> createPost(Post postToAdd) async {
    await Future.delayed(const Duration(seconds: 1));
    _fakePosts = [
      ..._fakePosts,
      postToAdd,
    ];
    return postToAdd;
  }

  @override
  Future<Post> updatePost(Post newPost) async {
    await Future.delayed(const Duration(seconds: 1));
    _fakePosts = _fakePosts.map((post) {
      if (post.id == newPost.id) {
        return newPost; // Remplace l'ancien post par le nouveau
      }
      return post;
    }).toList();
    return newPost;
  }
}