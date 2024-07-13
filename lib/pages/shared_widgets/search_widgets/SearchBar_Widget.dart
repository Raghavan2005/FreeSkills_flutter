import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/SearchState_Provider.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 0.25.sh,
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(0, 79, 3, 100),
                Color.fromRGBO(0, 174, 92, 100),
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 3, // Spread radius
                blurRadius: 5, // Blur radius
                offset: const Offset(0, 3), // Shadow offset (x, y)
              ),
            ],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Search",
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchFieldWithFilter(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<SearchstateProvider>(
                    builder: (BuildContext context, SearchstateProvider value,
                        Widget? child) {
                      return value.lastword.length != 0
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.lastword.length,
                              itemBuilder: (d, v) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IntrinsicWidth(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: GestureDetector(
                                              child: Text(
                                                value.lastword[v],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                8.0, // Adjusted the width for better spacing
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              value.removelastword(v);
                                            },
                                            child: Center(
                                              child: Icon(
                                                Icons.close,
                                                size: 13.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "No Previous Searches",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w200),
                              ),
                            );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchFieldWithFilter extends StatefulWidget {
  @override
  _SearchFieldWithFilterState createState() => _SearchFieldWithFilterState();
}

class _SearchFieldWithFilterState extends State<SearchFieldWithFilter> {
  final GlobalKey _filterKey = GlobalKey();

  void _showPopupMenu() {
    final RenderBox filterBox =
        _filterKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset position =
        filterBox.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + filterBox.size.height,
        position.dx + filterBox.size.width,
        position.dy,
      ),
      items: [
        PopupMenuItem<int>(
            value: 0,
            child: Row(
              children: [
                Checkbox(
                    value:
                        Provider.of<SearchstateProvider>(context, listen: false)
                            .filterstatus[0],
                    onChanged: (s) {}),
                Text("Option 1"),
              ],
            )),
        PopupMenuItem<int>(
            value: 1,
            child: Row(
              children: [
                Checkbox(
                    semanticLabel: 'Option 2',
                    value:
                        Provider.of<SearchstateProvider>(context, listen: false)
                            .filterstatus[1],
                    onChanged: (s) {}),
                Text("Option 2"),
              ],
            )),
        PopupMenuItem<int>(
            value: 2,
            child: Row(
              children: [
                Checkbox(
                    value:
                        Provider.of<SearchstateProvider>(context, listen: false)
                            .filterstatus[2],
                    onChanged: (s) {}),
                Text("Option 3"),
              ],
            )),
      ],
    ).then((value) {
      // Handle the selected option
      if (value != null) {
        Provider.of<SearchstateProvider>(context, listen: false)
            .updatedfilter(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black, fontSize: 14.sp),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide:
              const BorderSide(color: Colors.black), // Normal border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide:
              const BorderSide(color: Colors.black), // Unselected border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide:
              const BorderSide(color: Colors.black), // Selected border color
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide:
              const BorderSide(color: Colors.black), // Error border color
        ),
        hintText: "Search here",
        prefixIcon: const Icon(
          Icons.search,
        ),
        prefixIconColor: Colors.black,
        suffixIcon: GestureDetector(
          key: _filterKey,
          onTap: _showPopupMenu,
          child: Icon(
            Icons.filter_alt_rounded,
            color: Colors.black,
            size: 25.sp,
          ),
        ),
        hintStyle: const TextStyle(color: Colors.black),
        labelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        errorText: null,
      ),
      onSubmitted: (t) {},
    );
  }
}
