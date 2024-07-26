import 'package:FreeSkills/pages/shared_widgets/search_widgets/SearchBar_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/provider/SearchState_Provider.dart';
import '../../core/provider/UserDataState_Provider.dart';
import '../routes/RoutesNames.dart';
import '../shared_widgets/search_widgets/search_item_widget.dart';

// ignore: camel_case_types
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final up = Provider.of<UserdatastateProvider>(context, listen: false);
    return SafeArea(
        child: Column(
      children: [
        SearchbarWidget(),
        Consumer<SearchstateProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Expanded(
              child: value.searchlist.isNotEmpty
                  ? ListView.builder(
                      itemCount: value.searchlist.length,
                      itemBuilder: (c, i) {
                        var item =
                            value.getitemdata(context, value.searchlist[i]);
                        return GestureDetector(
                          onTap: () {
                            context.push(Routesnames.Player_Screen,
                                extra: {"item": item});
                          },
                          child: SearchItemWidget(
                            imageurl: item['course_video_url'],
                            titlename: item['course_title'],
                            videolen: item['video_timing'],
                            channelname: item['course_channel_url'],
                            langname:
                                up.searchbykey(up.langinfo, item['lang_id']),
                          ),
                        );
                      })
                  : Center(
                      child: Text("Search Value Not Found"),
                    ),
            );
          },
        )
      ],
    ));
  }
}
