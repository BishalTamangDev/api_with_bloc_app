import 'dart:async';

import 'package:api_with_bloc_app_learning/features/posts/models/post_model.dart';
import 'package:api_with_bloc_app_learning/features/posts/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialEvent>(postInitialEvent);

    // navigation
    on<PostNavigateToAddPostActionEvent>(postNavigateToAddPostActionEvent);
    on<PostNavigateToPostDetailActionEvent>(postNavigateToPostDetailActionEvent);
  }

  // post initial event
  FutureOr<void> postInitialEvent(
      PostInitialEvent event, Emitter<PostState> emit) async {
    emit(PostInitialState());

    List<PostDataModel> posts = await PostRepo.fetchAllPosts();

    emit(PostFetchingSuccessState(posts: posts));
  }

  FutureOr<void> postNavigateToAddPostActionEvent(
      PostNavigateToAddPostActionEvent event, Emitter<PostState> emit) {
    emit(PostNavigateToAddPostActionState());
  }

  FutureOr<void> postNavigateToPostDetailActionEvent(PostNavigateToPostDetailActionEvent event, Emitter<PostState> emit) {
    emit(PostNavigateToPostDetailActionState(postId: event.postId));
  }
}
