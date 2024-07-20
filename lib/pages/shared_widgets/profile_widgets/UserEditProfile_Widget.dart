import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/UserDataState_Provider.dart';
import '../../routes/RoutesNames.dart';

class UsereditprofileWidget extends StatelessWidget {
  const UsereditprofileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sup = Provider.of<UserdatastateProvider>(context, listen: true);
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
                            onPressed: () {
                              context.push(Routesnames.UserdataEditScreen);
                            },
                            icon: Icon(
                              size: 20.sp,
                              Icons.edit,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 70,
                      height: 70,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                sup.getUsername!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Text(sup.selectedcoursename!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
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
                  "FreeSkills",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
