import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../CORE/Errors/Failures.dart';
import '../../../CORE/UseCases/usecase.dart';
import '../Entities/Number_Trivia.dart';
import '../Repositories/Number_Trivia_repositories.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    // TODO: implement call
    return await repository.getRandomNumberTrivia();
  }
}

class NoParams extends Equatable {}
