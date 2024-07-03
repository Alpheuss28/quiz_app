class QuizQuestion {
  const QuizQuestion(this.text, this.answers);  // So that we can reuse this class and create different quiz question objects

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();  // List.of makes new copy of answers list and then .shuffle shuffles the new copy, so that we dont lose original
    return shuffledList;
  }
}