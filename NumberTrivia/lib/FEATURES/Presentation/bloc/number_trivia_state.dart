//part of 'number_trivia_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NumberTriviaState extends Equatable {
  NumberTriviaState([List props = const <dynamic>[]]) : super(props);
}

class NumberTriviaInitial extends NumberTriviaState {}
