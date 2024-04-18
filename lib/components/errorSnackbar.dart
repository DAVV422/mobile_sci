import 'package:flutter/material.dart';

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Color.fromARGB(255, 241, 8, 47),
    content: Text(text),
    duration: const Duration(seconds: 4),
  ));
}