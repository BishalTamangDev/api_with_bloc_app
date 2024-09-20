import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty),
            SizedBox(height: 16.0),
            Text("Page Not Found!"),
          ],
        ),
      ),
    );
  }
}
