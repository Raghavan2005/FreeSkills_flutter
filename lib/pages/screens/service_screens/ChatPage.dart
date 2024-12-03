/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 +   Freeskills (Andorid&iso)                                                 +
 +   Copyright (c) 2024 Raghavan                                              +
 +   GitHub: https://github.com/raghavan2005                                  +
 +   All rights reserved..                                                    +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +                                                                            +
 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive/hive.dart';

import '../../shared_widgets/chat_widgets/LineLoadingAnimation.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final GenerativeModel _model;
  late FocusNode _focusNode;

  //late final GenerativeModel _visionModel;
  late final ChatSession _chat;

  bool isloading = false;
  late Box box;

  @override
  void initState() {
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    _model = GenerativeModel(
        model: 'gemini-pro', apiKey: 'AIzaSyBmkxJUigrir4AtdjQfS_GxnEOrSQ8vj98');
    _chat = _model.startChat();
    box = Hive.box('UserData');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
    _chatController.dispose();
    _scrollController.dispose();
  }

  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];

  void _sendMessage() {
    DateTime time = DateTime.now();
    String formattedTime = '${time.hour}:${time.minute}';
    setState(() {
      if (_chatController.text.isNotEmpty) {
        _chatHistory.add({
          "time": formattedTime,
          "message": _chatController.text,
          "isSender": true,
        });
        getAnswer(_chatController.text);
        _chatController.clear();
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent,
        );
      }
    });
  }

  void getAnswer(String text) async {
    final response;

    setState(() {
      isloading = true;
    });
    try {
      var content = Content.text(text.toString());
      response = await _chat.sendMessage(content);
      setState(() {
        DateTime time = DateTime.now();
        String formattedTime = '${time.hour}:${time.minute}';
        _chatHistory.add({
          "time": formattedTime,
          "message": response.text,
          "isSender": false,
        });

        isloading = false;
      });

      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      );
    } on FormatException {
      setState(() {
        DateTime time = DateTime.now();
        String formattedTime = '${time.hour}:${time.minute}';
        _chatHistory.add({
          "time": formattedTime,
          "message":
              "I'm having trouble understanding your input. Could you please rewrite the sentence?",
          "isSender": false,
        });
        isloading = false;
      });
    }
  }

  TextSpan parseBoldText(String text) {
    final RegExp exp = RegExp(r'\*\*(.*?)\*\*');
    List<TextSpan> spans = [];
    int start = 0;

    text.splitMapJoin(
      exp,
      onMatch: (m) {
        if (m.start > start) {
          spans.add(TextSpan(text: text.substring(start, m.start)));
        }
        spans.add(TextSpan(
            text: m[1], style: TextStyle(fontWeight: FontWeight.bold)));
        start = m.end;
        return '';
      },
      onNonMatch: (n) {
        if (n.isNotEmpty) {
          spans.add(TextSpan(text: n));
        }
        return '';
      },
    );

    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.13.sh,
        foregroundColor: Colors.grey,
        backgroundColor: Colors.black,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.red, Colors.blue],
                  // Define your gradient colors here
                  tileMode: TileMode.clamp,
                ).createShader(bounds);
              },
              child: Text(
                "Indhu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.sp,
                    fontWeight: FontWeight.w600), // Adjust text color here
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Beta",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600), // Adjust text color here
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          _chatHistory.isEmpty
              ? Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 160,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Begin chatting with Indhu",
                        style:
                            TextStyle(color: Colors.white38, fontSize: 25.sp),
                      ),
                    ),
                  ),
                )
              : Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height - 160,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _chatHistory.length,
                          shrinkWrap: false,
                          controller: _scrollController,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              child: Align(
                                alignment: (_chatHistory[index]["isSender"]
                                    ? Alignment.topRight
                                    : Alignment.topLeft),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        // color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                    color: (_chatHistory[index]["isSender"]
                                        ? Colors.transparent
                                        : Colors.white12),
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: _chatHistory[index]
                                            ["isSender"]
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: _chatHistory[index]
                                                    ["isSender"]
                                                ? Colors.white
                                                : Colors.white,
                                          ),
                                          children: [
                                            parseBoldText(
                                                _chatHistory[index]["message"])
                                          ],
                                        ),
                                      ),
                                      Text(
                                          _chatHistory[index]["time"]
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: _chatHistory[index]
                                                      ["isSender"]
                                                  ? Colors.white
                                                  : Colors.grey)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 0.08.sh,
                      ),
                    ],
                  ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors
                              .white, // Change the color to your desired border color
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          focusNode: _focusNode,
                          onSubmitted: (v) {
                            //  _sendMessage();
                          },
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.purpleAccent,
                          decoration: const InputDecoration(
                            hintText: "Type a message",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          controller: _chatController,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  MaterialButton(
                    onPressed: isloading ? null : _sendMessage,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.red, Colors.blue]),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Container(
                          constraints: const BoxConstraints(
                              minWidth: 88.0, minHeight: 36.0),
                          alignment: Alignment.center,
                          child: isloading
                              ? DotJumpingAnimation()
                              : Icon(
                                  Icons.auto_awesome,
                                  color: Colors.white,
                                )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
