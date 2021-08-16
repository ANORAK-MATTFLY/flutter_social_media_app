import 'package:flutter/material.dart';

defaultSnackBar(String message, context, bool isUrgency) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isUrgency ? Colors.red : null,
      content: Text(message),
    ),
  );
}
