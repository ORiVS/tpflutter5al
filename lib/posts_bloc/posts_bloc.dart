import 'package:bloc/bloc.dart';
import 'package:tpflutter5al/data/posts_data_source.dart';
import 'package:tpflutter5al/models/post.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final FakePostsDataSource dataSource;

  PostsBloc(this.dataSource) : super(const PostsInitialState()) {
    on<GetAllPosts>((event, emit) async {
      emit(const PostsLoadingState());
      try {
        final posts = await dataSource.getAllPosts(); // Appel simple
        emit(PostsLoadedState(posts));
      } catch (e) {
        emit(PostsErrorState('Failed to fetch posts'));
      }
    });

    on<CreatePost>((event, emit) async {
      try {
        await dataSource.createPost(event.post);
        add(const GetAllPosts());
      } catch (e) {
        emit(PostsErrorState('Failed to create post'));
      }
    });

    on<UpdatePost>((event, emit) async {
      try {
        await dataSource.updatePost(event.post);
        add(const GetAllPosts());
      } catch (e) {
        emit(PostsErrorState('Failed to update post'));
      }
    });
  }
}
