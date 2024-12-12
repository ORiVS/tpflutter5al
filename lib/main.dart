import 'package:tpflutter5al/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tpflutter5al/blocs/posts_bloc/posts_bloc.dart';
import 'package:tpflutter5al/services/data_source/fake_post_data_source.dart';
import 'package:tpflutter5al/services/posts_repository/posts_repository.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => PostsBloc(
        repository: PostRepository(
          dataSource: FakePostsDataSource(),
        ),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostsScreen(),
    );
  }
}