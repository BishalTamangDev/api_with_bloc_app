import 'dart:convert';
import 'dart:math';

import 'package:api_with_bloc_app_learning/features/posts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  // fetch all posts
  static Future<List<PostDataModel>> fetchAllPosts() async {
    // fetch posts
    var client = http.Client();

    List<PostDataModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        for (var jsonItem in jsonData) {
          PostDataModel post =
              PostDataModel.fromMap(jsonItem as Map<String, dynamic>);
          posts.add(post);
        }
      }
    } catch (e) {
      log(e.toString() as num);
    } finally {
      client.close();
    }

    return posts;
  }

  // add post
  static Future<bool> addPost() async {
    var status = false;

    // fetch posts
    var client = http.Client();

    List<PostDataModel> posts = [];
    try {
      var response = await client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: ({
          "title": 'foo',
          "body": 'bar',
          "userId": '1',
        }),
      );

      status = (response.statusCode >= 200 && response.statusCode < 300)
          ? true
          : false;
    } catch (e) {
      log(e.toString() as num);
    } finally {
      client.close();
    }

    return status;
  }

//   fetch post
  static Future<PostDataModel> fetchPost({required int postId}) async {
    PostDataModel post =
        PostDataModel(userId: 0, id: postId, title: '', body: '');
    // fetch posts
    var client = http.Client();

    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        post = PostDataModel(
          userId: jsonData['userId'],
          id: postId,
          title: jsonData['title'] ?? "",
          body: jsonData['body'] ?? "",
        );
      }
    } catch (e) {
      log(e.toString() as num);
    } finally {
      client.close();
    }

    return post;
  }
}
