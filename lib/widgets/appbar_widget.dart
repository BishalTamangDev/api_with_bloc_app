import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {super.key, this.appbarTitle = "A P I - W I T H - B L O C"});

  final String appbarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appbarTitle),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
