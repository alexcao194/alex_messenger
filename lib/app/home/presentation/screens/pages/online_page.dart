import 'package:flutter/material.dart';

abstract class OnlinePage extends StatelessWidget {
  const OnlinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}