part of '../../posts/bloc/post_bloc.dart';

@immutable
sealed class PostEvent {}

// action event
abstract class PostActionEvent extends PostEvent {}

// initial
class PostInitialEvent extends PostEvent {}

// navigate to add post page
class PostNavigateToAddPostActionEvent extends PostActionEvent {}

// navigate to post detail page
class PostNavigateToPostDetailActionEvent extends PostActionEvent {
  final int postId;
  PostNavigateToPostDetailActionEvent({required this.postId});
}
