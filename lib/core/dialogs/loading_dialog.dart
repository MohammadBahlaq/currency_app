import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
    this.message,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [CircularProgressIndicator(), Text("Loading...")],
      ),
    );
  }
}
