import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class UserdataEdit extends StatelessWidget {
  UserdataEdit({super.key});

  bool isKeyboardOpen = false;
  TextEditingController cm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    cm.text = "Raghavan";
    return Container(
        color: Colors.black,
        child: ScaffoldGradientBackground(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.decal,
            stops: [0.0, 0.70],
            colors: [
              Colors.white12,
              Colors.black12,
            ],
          ),
          appBar: AppBar(
            foregroundColor: Colors.white,
            centerTitle: true,
            toolbarHeight: 100.0,
            backgroundColor: Colors.black87,
            title: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          body: SingleChildScrollView(
            physics: isKeyboardOpen ? null : NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.1.sh,
                ),
                CircleAvatar(
                  radius: 60,
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: cm,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Normal border color
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Unselected border color
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Selected border color
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red), // Error border color
                      ),
                      hintText: " ",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      labelText: "Username",
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      errorText: null,
                    ),
                    onSubmitted: (val) {
                      // value.updatetheusername(val);
                    },
                  ),
                ),
                SizedBox(
                  height: 0.04.sh,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: "Web Technology",
                        dropdownColor: Colors.black,
                        elevation: 10,
                        isExpanded: true,
                        underline: Container(),
                        icon: const Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {},
                        items: <String>[
                          'Mobile Application Development',
                          'Web Technology',
                          'AI/ML Engineer',
                          'System Designer'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        backgroundColor: WidgetStateProperty.all(Colors.blue)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Save & Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.sp),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
