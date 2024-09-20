import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../posts/repos/post_repo.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  AddPostBloc() : super(AddPostInitial()) {
    on<AddPostEvent>((event, emit) {});
    on<PostAddingEvent>(postAddingEvent);
    on<PostAddSuccessEvent>(postAddSuccessEvent);
    on<PostAddFailureEvent>(postAddFailureEvent);
  }

  // post adding :: initial
  FutureOr<void> postAddingEvent(
      PostAddingEvent event, Emitter<AddPostState> emit) async {
    emit(PostAddingState());

    bool status = await PostRepo.addPost(event.title, event.description);

    if (status) {
      emit(PostAddSuccessState());
    } else {
      emit(PostAddFailureState());
    }
  }

  // post adding :: success
  FutureOr<void> postAddSuccessEvent(
      PostAddSuccessEvent event, Emitter<AddPostState> emit) {
    emit(PostAddSuccessState());
  }

  // post adding :: failure
  FutureOr<void> postAddFailureEvent(
      PostAddFailureEvent event, Emitter<AddPostState> emit) {
    emit(PostAddFailureState());
  }
}
