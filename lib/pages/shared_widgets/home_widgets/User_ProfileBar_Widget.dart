import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/UserDataState_Provider.dart';
import '../../../core/services/datasource/Image_Network_Provider.dart';
import '../../routes/RoutesNames.dart';

class UserProfilebar_Widget extends StatelessWidget {
  UserProfilebar_Widget(
      {super.key, required this.username, this.courename, this.imageurl});

  final String? username, courename, imageurl;

  @override
  Widget build(BuildContext context) {
    final notvaluedata =
        Provider.of<UserdatastateProvider>(context, listen: false);
    return SizedBox(
      width: double.infinity,
      height: 0.23.sh,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 15),
                child: Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 40.w,
                      height: 40.h,
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                // Shadow color
                                spreadRadius: 3,
                                // Spread radius
                                blurRadius: 5,
                                // Blur radius
                                offset:
                                    const Offset(0, 3), // Shadow offset (x, y)
                              ),
                            ],
                            borderRadius: BorderRadius.circular(100),
                            color: const Color.fromRGBO(1, 89, 24, 100),
                          ),
                          child: IconButton(
                              onPressed: () async {
                                context.push(Routesnames.NotificationScreen);
                              },
                              icon: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Icon(
                                    size: 20.sp,
                                    CupertinoIcons.bell,
                                    color: Colors.grey,
                                  ),
                                  notvaluedata.notlist.isNotEmpty
                                      ? Icon(
                                          Icons.circle,
                                          color: Colors.red,
                                          size: 6,
                                        )
                                      : Icon(
                                          Icons.circle,
                                          color: Colors.red,
                                          size: 0,
                                        ),
                                ],
                              ))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        // Adjust the radius as needed
                        child :Image.network(
                          imageurl!,
                          fit: BoxFit.cover, // Adjust fit as needed: BoxFit.cover, BoxFit.contain, etc.
                          errorBuilder: (context, error, stackTrace) {
                            ImageNetworkProvider nm = ImageNetworkProvider();
                           String? name= nm.getProfileLink(username!).toString();
                           print(error);
                            return Image.network(
                              name,
                                fit: BoxFit.cover,);
                          },
                        ),


                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hello",
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                username!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(courename!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                child: Text(
                  "freeskills",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white54),
                ).tr(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
