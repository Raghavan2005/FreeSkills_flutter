import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/provider/SetupState_Provider.dart';

class CompletedSixSub extends StatelessWidget {
  const CompletedSixSub({super.key});

  @override
  Widget build(BuildContext context) {
    final setupmain = Provider.of<SetupstateProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: CircularProgressIndicator(),
        ),
        Text(
          setupmain.tryagain ? "Account Created" : "Done",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
