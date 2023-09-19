class quizzQuestion {
  const quizzQuestion(this.txt, this.answers);
  final String txt;
  final List<String> answers;

  //For shuffeled question
  List<String> getShuffledAnswer() {
    final shuffledList = List.of(
        answers); //here List.of is mainly copying the answers..,mainly 4th line
    shuffledList.shuffle(); //using this method we are shuffling the question
    return shuffledList;
  }
}
