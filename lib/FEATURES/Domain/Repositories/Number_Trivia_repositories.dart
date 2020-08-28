import 'package:dartz/dartz.dart';

import '../../../CORE/Errors/Failures.dart';
import '../Entities/Number_Trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
