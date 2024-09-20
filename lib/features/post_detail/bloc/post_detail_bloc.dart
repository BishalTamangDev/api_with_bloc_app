import 'dart:async';

import 'package:api_with_bloc_app_learning/features/posts/models/post_model.dart';
import 'package:api_with_bloc_app_learning/features/posts/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc() : super(PostDetailInitial()) {
    on<PostDetailEvent>((event, emit) {});
    on<PostDetailFetchEvent>(postDetailFetchEvent);
  }

  //   post detail fetch event :: initial
  FutureOr<void> postDetailFetchEvent(
      PostDetailFetchEvent event, Emitter<PostDetailState> emit) async {
    emit(PostDetailFetchState());

    PostDataModel post = await PostRepo.fetchPost(postId: event.postId);

    emit(PostDetailFetchSuccessState(post: post));
  }
}
