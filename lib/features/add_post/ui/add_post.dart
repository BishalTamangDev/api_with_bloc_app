import 'package:api_with_bloc_app_learning/features/add_post/bloc/add_post_bloc.dart';
import 'package:api_with_bloc_app_learning/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  String errorMessage = "An error occurred!";
  bool error = false;

  TextEditingController tecTitle = TextEditingController();
  TextEditingController tecDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AddPostBloc addPostBloc = context.read<AddPostBloc>();
    return BlocConsumer<AddPostBloc, AddPostState>(
      bloc: addPostBloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case PostAddingState:
            return const Scaffold(
              appBar: AppBarWidget(appbarTitle: "Add Post"),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10.0),
                    Text("Adding Post"),
                  ],
                ),
              ),
            );
          case PostAddFailureState:
            return const Scaffold(
              appBar: AppBarWidget(appbarTitle: "Add Post"),
              body: Center(
                child: Text(
                  "Adding Post Failed!",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            );
          case PostAddSuccessState:
            return const Scaffold(
              appBar: AppBarWidget(appbarTitle: "Add Post"),
              body: Center(
                child: Text(
                  "Adding Post Successful!",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            );
          default:
            return Scaffold(
              appBar: const AppBarWidget(appbarTitle: "Add Post"),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // user id
                      const SizedBox(height: 16.0),

                      if (error)
                        Column(
                          children: [
                            Text(
                              errorMessage,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),

                      // title
                      TextField(
                        controller: tecTitle,
                        decoration: const InputDecoration(
                          hintText: "Post title",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10.0),

                      //   body
                      TextField(
                        controller: tecDescription,
                        decoration: InputDecoration(
                          hintText: "Post description",
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 10.0),

                      // add post button
                      SizedBox(
                        width: double.infinity,
                        height: 42.0,
                        child: ElevatedButton(
                          onPressed: () {
                            String postTitle = tecTitle.text.toString();
                            String postDescription =
                                tecDescription.text.toString();

                            if (postTitle.isEmpty) {
                              errorMessage = "Please enter the post title!";
                              error = true;
                              setState(() {});
                            } else {
                              errorMessage = "An error occurred!";
                              error = false;

                              // add event :: adding post
                              addPostBloc.add(
                                PostAddingEvent(
                                    title: postTitle,
                                    description: postDescription),
                              );
                            }
                          },
                          child: const Text("Add Post"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
