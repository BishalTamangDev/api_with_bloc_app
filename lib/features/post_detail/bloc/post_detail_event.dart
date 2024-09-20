part of 'post_detail_bloc.dart';

@immutable
sealed class PostDetailEvent {}

// post detail fetch :: initial
class PostDetailFetchEvent extends PostDetailEvent {
  final int postId;
  PostDetailFetchEvent({required this.postId});
}

// post detail fetch :: success
class PostDetailFetchSuccessEvent extends PostDetailEvent {}

// post detail fetch :: failure
class PostDetailFetchFailureEvent extends PostDetailEvent {}
