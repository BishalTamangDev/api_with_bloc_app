part of 'post_detail_bloc.dart';

@immutable
sealed class PostDetailState {}

// action state
abstract class PostDetailActionState extends PostDetailState {}

final class PostDetailInitial extends PostDetailState {}

// post detail fetch :: initial
class PostDetailFetchState extends PostDetailState {}

// post detail fetch :: success
class PostDetailFetchSuccessState extends PostDetailState {
  final PostDataModel post;

  PostDetailFetchSuccessState({required this.post});
}

// post detail fetch :: failure
class PostDetailFetchFailureState extends PostDetailState {}
