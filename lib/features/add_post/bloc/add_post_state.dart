part of 'add_post_bloc.dart';

@immutable
sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

// action state
abstract class AddPostActionState extends AddPostState {}

// add post :: initial
class PostAddingState extends AddPostState {}

// add post :: success
class PostAddSuccessState extends AddPostState {}

// add post :: failure
class PostAddFailureState extends AddPostState {}
