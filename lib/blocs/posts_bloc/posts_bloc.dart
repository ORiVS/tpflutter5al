import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/post.dart';
import 'package:tpflutter5al/services/posts_repository/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository repository;

  PostsBloc({required this.repository}) : super(const PostsState()) {
    on<GetAllPosts>((event, emit) async {
      emit(state.copyWith(status: PostsStatus.loading));
      try {
        final posts = await repository.getAllPosts();
        emit(state.copyWith(status: PostsStatus.success, posts: posts));
      } catch (e) {
        emit(state.copyWith(status: PostsStatus.error, errorMessage: 'Failed to fetch posts'));
      }
    });

    on<CreatePost>((event, emit) async {
      try {
        await repository.createPost(event.post);
        add(const GetAllPosts()); // Rafraîchit la liste après ajout
      } catch (e) {
        emit(state.copyWith(status: PostsStatus.error, errorMessage: 'Failed to create post'));
      }
    });

    on<UpdatePost>((event, emit) async {
      try {
        await repository.updatePost(event.post);
        add(const GetAllPosts()); // Rafraîchit la liste après mise à jour
      } catch (e) {
        emit(state.copyWith(status: PostsStatus.error, errorMessage: 'Failed to update post'));
      }
    });
  }
}