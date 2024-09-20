part of '../../posts/bloc/post_bloc.dart';

@immutable
sealed class PostState {}

// initials action state
class PostActionState extends PostState {}

final class PostInitial extends PostState {}

class PostInitialState extends PostState {}

// fetch posts :: success state
class PostFetchingSuccessState extends PostState {
  List<PostDataModel> posts;

  PostFetchingSuccessState({required this.posts});
}

// fetch posts :: failure state
class PostFetchingFailureState extends PostState {}

//navigate to add post page
class PostNavigateToAddPostActionState extends PostActionState {}

// navigate to post detail page
class PostNavigateToPostDetailActionState extends PostActionState{
  final int postId;
  PostNavigateToPostDetailActionState({required this.postId});
}
