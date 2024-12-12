import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/posts_data_source.dart';
import '../models/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final FakePostsDataSource dataSource;

  PostsBloc(this.dataSource) : super(const PostsState()) {
    on<GetAllPosts>((event, emit) async {
      emit(state.copyWith(status: PostsStatus.loading)); // État de chargement
      try {
        final posts = await dataSource.getAllPosts();
        emit(state.copyWith(
          posts: posts,
          status: PostsStatus.success,
        )); // État de succès avec les posts
      } catch (e) {
        emit(state.copyWith(
          status: PostsStatus.error,
          errorMessage: 'Failed to fetch posts',
        )); // État d'erreur
      }
    });

    on<CreatePost>((event, emit) async {
      try {
        await dataSource.createPost(event.post);
        add(const GetAllPosts()); // Rafraîchissement après création
      } catch (e) {
        emit(state.copyWith(
          status: PostsStatus.error,
          errorMessage: 'Failed to create post',
        ));
      }
    });

    on<UpdatePost>((event, emit) async {
      try {
        await dataSource.updatePost(event.post);
        add(const GetAllPosts()); // Rafraîchissement après mise à jour
      } catch (e) {
        emit(state.copyWith(
          status: PostsStatus.error,
          errorMessage: 'Failed to update post',
        ));
      }
    });
  }
}
