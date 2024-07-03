
class QuestionIdentifier {
  QuestionIdentifier(this.isCorrectAnswer);

  final bool isCorrectAnswer;
}

class SummaryItem {
  SummaryItem(this.itemData)
      : isCorrectAnswer =
            (itemData != null && itemData["user_answer"] == itemData["correct_answer"]);

  final Map<String, Object>? itemData; // Add a nullable annotation if itemData can be null.
  final bool isCorrectAnswer;

  // Named constructor within the SummaryItem class
  // Syntax should be: ReturnType constructorName({Parameters})
  // The constructor name should match the class name
  SummaryItem.questionIdentifier({required bool isCorrectAnswer})
      : itemData = null, // Initialize itemData, adjust this according to your logic
        isCorrectAnswer = isCorrectAnswer; // Assign the provided isCorrectAnswer to the class member
}
