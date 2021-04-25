import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/src/controller/question.dart';
import 'package:quiz_app/src/controller/question_controller.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GetBuilder<QuestionController>(
                    init: QuestionController(),
                    builder: (controller) {
                      return Stack(
                        children: <Widget>[
                          LayoutBuilder(
                            builder: (context, constraints) => Container(
                              width: constraints.maxWidth *
                                  controller.animation.value,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black54,
                                    Colors.black12,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${(controller.animation.value * 60).round()} sec",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.lock_clock,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Question ${_controller.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black54),
                      children: [
                        TextSpan(
                            text: "/${_controller.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: Colors.black54)),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller.pageController,
                  onPageChanged: _controller.updateQuestionNumber,
                  itemCount: _controller.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _controller.questions[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({Key key, @required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black54),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black54),
          ),
          SizedBox(
            height: 12,
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAnswer(question, index),
            ),
          ),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;

  const Option({Key key, this.text, this.index, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) {
        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: getColor(controller, index)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${index + 1} $text",
                  style: TextStyle(
                      color: getColor(controller, index), fontSize: 16),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getColor(controller, index) == Colors.grey
                        ? Colors.transparent
                        : getColor(controller, index),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getColor(controller, index)),
                  ),
                  child: getColor(controller, index) == Colors.grey
                      ? null
                      : Icon(
                          getIcon(controller, index),
                          size: 16,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Color getColor(QuestionController controller, int index) {
  if (controller.isAnswered) {
    if (index == controller.correctAnswer) {
      return Colors.green;
    } else if (index == controller.selectedAnswer &&
        controller.selectedAnswer != controller.correctAnswer) {
      return Colors.red;
    }
  }

  return Colors.grey;
}

IconData getIcon(QuestionController controller, int index) {
  return getColor(controller, index) == Colors.red ? Icons.close : Icons.done;
}
