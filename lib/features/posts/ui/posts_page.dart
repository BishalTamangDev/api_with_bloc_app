import 'package:api_with_bloc_app_learning/features/add_post/bloc/add_post_bloc.dart';
import 'package:api_with_bloc_app_learning/features/add_post/ui/add_post.dart';
import 'package:api_with_bloc_app_learning/features/posts/ui/posts_fetching_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/page_not_found_screen.dart';
import '../../../widgets/appbar_widget.dart';
import '../../post_detail/bloc/post_detail_bloc.dart';
import '../../post_detail/ui/post_detail_page.dart';
import '../bloc/post_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<StatefulWidget> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostBloc>();

    postBloc.add(PostInitialEvent());

    return BlocConsumer<PostBloc, PostState>(
      bloc: postBloc,
      listenWhen: (previous, current) => current is PostActionState,
      buildWhen: (previous, current) => current is! PostActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case PostNavigateToPostDetailActionState:
            var tempState = state as PostNavigateToPostDetailActionState;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => PostDetailBloc(),
                  child: PostDetailPage(
                    postId: tempState.postId,
                  ),
                ),
              ),
            );
          case PostNavigateToAddPostActionState:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (BuildContext context) => AddPostBloc(),
                  child: const AddPostPage(),
                ),
              ),
            );
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case PostInitialState:
            return const PostLoadingPage();
          case PostFetchingSuccessState:
            final successState = state as PostFetchingSuccessState;
            return Scaffold(
              appBar: const AppBarWidget(
                appbarTitle: "Posts",
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: successState.posts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            postBloc.add(
                              PostNavigateToPostDetailActionEvent(
                                  postId: successState.posts[index].id),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: ListTile(
                                title: Text(
                                  successState.posts[index].title,
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8.0),
                                    Text(successState.posts[index].body),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  postBloc.add(PostNavigateToAddPostActionEvent());
                },
                child: const Icon(Icons.add),
              ),
            );
          case PostFetchingFailureState:
            return const Scaffold(
              body: Center(
                child: Text("Error in fetching posts"),
              ),
            );
          default:
            return const PageNotFoundScreen();
        }
      },
    );
  }
}
