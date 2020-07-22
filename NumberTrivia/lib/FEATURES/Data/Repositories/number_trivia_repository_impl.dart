import 'package:dartz/dartz.dart';

import '../../../CORE/Errors/Failures.dart';
import '../../Domain/Entities/Number_Trivia.dart';
import '../../Domain/Repositories/Number_Trivia_repositories.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) {
    // TODO: implement getConcreteNumberTrivia
    return null;
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    return null;
  }
}
