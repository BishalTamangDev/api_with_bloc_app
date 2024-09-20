import 'package:api_with_bloc_app_learning/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(appbarTitle: "Add Post"),
      body: Center(
        child: Text("Add Post Page"),
      ),
    );
  }
}
