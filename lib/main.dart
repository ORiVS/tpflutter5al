import 'package:tpflutter5al/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'posts_bloc/posts_bloc.dart';
import 'package:tpflutter5al/data/posts_data_source.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => PostsBloc(FakePostsDataSource()), // Injectez ici votre bloc et la source de données
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
