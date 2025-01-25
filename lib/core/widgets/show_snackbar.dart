import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
              ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
        left: 80,
        right: 80,
      ),
      duration: const Duration(
        seconds: 2,
        milliseconds: 50,
      ),
      backgroundColor: color,
    ),
  );
}
