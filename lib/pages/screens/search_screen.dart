import 'package:FreeSkills/pages/shared_widgets/search_widgets/SearchBar_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/search_widgets/search_item_widget.dart';

// ignore: camel_case_types
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SearchbarWidget(),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (c, i) {
                return SearchItemWidget();
              }),
        )
      ],
    ));
  }
}
