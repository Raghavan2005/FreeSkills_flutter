import 'package:flutter/material.dart';

class CompletedSixSub extends StatelessWidget {
  const CompletedSixSub({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: CircularProgressIndicator(),
        ),
        Text(
          "Account Created",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
