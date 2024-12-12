import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/post.dart';
import 'package:tpflutter5al/blocs/posts_bloc/posts_bloc.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newPost = Post(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  description: descriptionController.text,
                );
                BlocProvider.of<PostsBloc>(context).add(CreatePost(newPost));
                Navigator.pop(context);
              },
              child: const Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}
