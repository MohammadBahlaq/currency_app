import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    this.message,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_outline,
            size: 30.sp,
            color: Colors.red,
          ),
          SizedBox(height: 1.h),
          Text(message ?? ""),
        ],
      ),
    );
  }
}
