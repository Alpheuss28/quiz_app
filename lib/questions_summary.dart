import 'package:flutter/material.dart';
import 'package:quiz_app/question_identifier.dart'; // Import the file containing QuestionIdentifier and SummaryItem classes

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(
    this.summaryData, {
    Key? key,
  }) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map<Widget>(
            (data) {
              // Calculate isCorrectAnswer based on data
              bool isCorrectAnswer = SummaryItem(data).isCorrectAnswer;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCorrectAnswer
                              ? const Color.fromARGB(255, 150, 198, 241)
                              : const Color.fromARGB(255, 249, 133, 241),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          ((data["question_index"] as int) + 1).toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      width: 10), // Add space between index and question
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["user_answer"] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 190, 54, 244),
                          ),
                        ),
                        Text(
                          data["correct_answer"] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 26, 149, 250),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(), //Converts to a list
        ),
      ),
    );
  }
}
