import 'package:NumberTrivia/CORE/Errors/Failures.dart';
import 'package:NumberTrivia/CORE/UseCases/usecase.dart';
import 'package:NumberTrivia/FEATURES/Domain/Entities/Number_Trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
//import 'package:flutter/cupertino.dart';

import '../Repositories/Number_Trivia_repositories.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, int> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  //execute({int number}) async {}
  //@override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  Params({@required this.number}) : super([number]);

  //@override
  //List<Object> get props => [number];
}
