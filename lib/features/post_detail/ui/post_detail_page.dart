import 'package:api_with_bloc_app_learning/features/post_detail/bloc/post_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/appbar_widget.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    final postDetailBloc = context.read<PostDetailBloc>();
    postDetailBloc.add(PostDetailFetchEvent(postId: postId));
    return BlocBuilder<PostDetailBloc, PostDetailState>(
      bloc: postDetailBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case PostDetailFetchState:
            return const Scaffold(
              appBar: AppBarWidget(appbarTitle: "Post Detail"),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16.0),
                    Text("Fetching Post Detail"),
                  ],
                ),
              ),
            );
          case PostDetailFetchSuccessState:
            final tempState = state as PostDetailFetchSuccessState;
            return Scaffold(
              appBar: const AppBarWidget(appbarTitle: "Post Detail"),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),

                      // user id
                      Row(
                        children: [
                          const CircleAvatar(
                            child: Icon(Icons.people),
                          ),
                          const SizedBox(width: 10.0),
                          Text("User ID : ${tempState.post.userId}"),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                      // post id
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text("Post ID : ${tempState.post.id}"),
                        ),
                      ),

                      const SizedBox(height: 10.0),

                      // title
                      Text(
                        tempState.post.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10.0),

                      // body
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          tempState.post.body,
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            );
          default:
            return const Scaffold(
              appBar: AppBarWidget(appbarTitle: "Post Detail"),
              body: Center(
                child: Text("Error in fetching the post."),
              ),
            );
        }
      },
    );
  }
}
