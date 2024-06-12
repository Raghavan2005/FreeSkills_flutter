import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(
    const GetMaterialApp(
      home: MaterialApp(
        home: App(),
      ),
    )
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
