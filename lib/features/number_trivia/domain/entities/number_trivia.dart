import 'package:equatable/equatable.dart';

///the number trivia entity
///
///it contains the text and the number of the trivia
class NumberTrivia extends Equatable {
  final String text;
  final int number;

  const NumberTrivia({required this.text, required this.number});

  @override
  List<Object> get props => [text, number];
}
