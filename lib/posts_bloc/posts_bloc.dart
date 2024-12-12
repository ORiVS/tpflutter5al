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
      emit(const PostsState(status: PostsStatus.loading)); // Chargement
      try {
        final posts = await dataSource.getAllPosts();
        print('PostsBloc: Fetched ${posts.length} posts');
        emit(PostsState(status: PostsStatus.success, posts: posts)); // Succès
      } catch (e) {
        emit(PostsState(
          status: PostsStatus.error,
          errorMessage: 'Failed to fetch posts',
        )); // Erreur
      }
    });

    on<CreatePost>((event, emit) async {
      try {
        await dataSource.createPost(event.post);
        add(const GetAllPosts()); // Rafraîchit les posts après création
      } catch (e) {
        emit(PostsState(
          status: PostsStatus.error,
          errorMessage: 'Failed to create post',
        )); // Erreur
      }
    });

    on<UpdatePost>((event, emit) async {
      try {
        await dataSource.updatePost(event.post);
        add(const GetAllPosts()); // Rafraîchit les posts après modification
      } catch (e) {
        emit(PostsState(
          status: PostsStatus.error,
          errorMessage: 'Failed to update post',
        )); // Erreur
      }
    });
  }
}
