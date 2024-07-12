import 'package:FreeSkills/core/utils/DeviceInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _deviceInfo = 'Fetching device info...';
  Deviceinfo di = Deviceinfo();

  @override
  void initState() {
    super.initState();
    _fetchDeviceInfo();
  }

  Future<void> _fetchDeviceInfo() async {
    String deviceInfo = await di.getDeviceAndAppDetails();
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 100.0,
        backgroundColor: Colors.black87,
        title: Text(
          "About",
          style: TextStyle(
              color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                  text: TextSpan(
                      text: _deviceInfo +
                          "\n Width : " +
                          MediaQuery.of(context).size.width.toString() +
                          "\n Height : " +
                          MediaQuery.of(context).size.height.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600))),
            ),
          ),
        ],
      ),
    );
  }
}
