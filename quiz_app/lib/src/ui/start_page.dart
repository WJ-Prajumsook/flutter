import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/ui/home_page.dart';
import 'package:quiz_app/src/ui/question_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.to(() => HomePage()),
          child: Icon(
            Icons.navigate_before,
            color: Colors.black54,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Skip'),
          ),
        ],
      ),
      body: QuestionPage(),
    );
  }
}
