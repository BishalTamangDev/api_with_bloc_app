part of 'add_post_bloc.dart';

@immutable
sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

// action state
abstract class AddPostActionState extends AddPostState {}

// add post state
// add post :: success
class PostAdditionSuccessState extends AddPostActionState {}

// add post :: failure
class PostAdditionFailureState extends AddPostActionState {}
