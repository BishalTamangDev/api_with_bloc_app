import 'package:api_with_bloc_app_learning/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PostLoadingPage extends StatelessWidget {
  const PostLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(appbarTitle: "Posts"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16.0),
            Text("Fetching posts"),
          ],
        ),
      ),
    );
  }
}
