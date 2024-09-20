import 'package:api_with_bloc_app_learning/features/post_detail/bloc/post_detail_bloc.dart';
import 'package:api_with_bloc_app_learning/features/posts/bloc/post_bloc.dart';
import 'package:api_with_bloc_app_learning/features/posts/ui/posts_page.dart';
import 'package:api_with_bloc_app_learning/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API with BLOC',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => PostBloc(),
          ),
          BlocProvider(
            create: (BuildContext context) => PostDetailBloc(),
          ),
        ],
        child: const PostsPage(),
      ),
    );
  }
}
