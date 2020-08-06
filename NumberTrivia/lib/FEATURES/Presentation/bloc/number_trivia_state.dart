//part of 'number_trivia_bloc.dart';
import 'package:NumberTrivia/FEATURES/Domain/Entities/Number_Trivia.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NumberTriviaState extends Equatable {
  NumberTriviaState([List props = const <dynamic>[]]) : super(props);
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({@required this.trivia}) : super([trivia]);
}

class Error extends NumberTriviaState {
  final String message;

  Error({@required this.message}) : super([message]);
}

