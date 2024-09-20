part of 'add_post_bloc.dart';

@immutable
sealed class AddPostEvent {}

// action event
abstract class AddPostActionEvent extends AddPostEvent {}

// adding post :: initial
class PostAddingEvent extends AddPostEvent {
  final String title;
  final String description;

  PostAddingEvent({required this.title, required this.description});
}

// adding post :: success state
class PostAddSuccessEvent extends AddPostEvent {}

// adding post :: failure state
class PostAddFailureEvent extends AddPostEvent {}
