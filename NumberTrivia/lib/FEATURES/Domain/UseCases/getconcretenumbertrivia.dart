import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../CORE/Errors/Failures.dart';
import '../../../CORE/UseCases/usecase.dart';
import '../Entities/Number_Trivia.dart';
import '../Repositories/Number_Trivia_repositories.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, int> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(
    @required int number,
  ) async {
    return await repository.getConcreteNumberTrivia(number);
  } //why is this call method a wrong one?
}

class Params extends Equatable {
  final int number;

  Params({@required this.number}) : super([number]);

  //@override
  //List<Object> get props => [number];
}
