class quizzQuestions {
  const quizzQuestions(this.question, this.answer);
  final String question;
  final List<String> answer;

  List<String> getShuffledAnswer() {
    final shuffledAnswer = List.of(answer);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
