import 'package:FreeSkills/pages/shared_widgets/search_widgets/SearchBar_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/provider/SearchState_Provider.dart';
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
        Consumer<SearchstateProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Expanded(
              child: ListView.builder(
                  itemCount: value.searchlist.length,
                  itemBuilder: (c, i) {
                    var item = value.getitemdata(context, value.searchlist[i]);
                    return SearchItemWidget(
                      imageurl: item['course_video_url'],
                      titlename: item['course_title'],
                      videolen: item['video_timing'],
                      channelname: item['course_channel_url'],
                    );
                  }),
            );
          },
        )
      ],
    ));
  }
}
