import 'package:flutter/material.dart';

class TitleElement extends StatelessWidget {
  const TitleElement({required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Text(
        content,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
