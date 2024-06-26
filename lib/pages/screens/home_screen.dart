import 'package:flutter/material.dart';

import '../shared_widgets/NavBar_Shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text(
          "hello",
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: NavBar_Shared(),
    );
  }
}
