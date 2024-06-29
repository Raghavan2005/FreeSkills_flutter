import 'package:flutter/material.dart';
import 'package:freeskills/pages/shared_widgets/search_widgets/SearchBar_Widget.dart';

// ignore: camel_case_types
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
      children: [SearchbarWidget()],
    ));
  }
}
