part of 'add_post_bloc.dart';

@immutable
sealed class AddPostEvent {}

// action event
abstract class AddPostActionEvent extends AddPostEvent{}

// adding post :: initial
class PostAdditionLoadingEvent extends AddPostEvent {}

// adding post :: success state
class PostAdditionSuccessEvent extends AddPostEvent {}

// adding post :: failure state
class PostAdditionFailureEvent extends AddPostEvent {}
