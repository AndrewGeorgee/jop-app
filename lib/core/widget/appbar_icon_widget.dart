import 'package:flutter/material.dart';

class AppBarIconWidget extends StatelessWidget {
  final VoidCallback onTab;
  const AppBarIconWidget({
    super.key,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTab,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ));
  }
}
