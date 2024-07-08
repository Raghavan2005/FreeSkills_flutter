import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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
          "Settings",
          style: TextStyle(
              color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: Text("hello")),
          DropdownButton(
            // Initial Value
            value: 'Item 1',

            // Down Arrow Icon
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (c) {},
            // After selecting the desired option,it will
            // change button value to selected value
          ),
        ],
      ),
    );
  }
}
