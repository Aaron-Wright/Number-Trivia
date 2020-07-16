import 'package:NumberTrivia/CORE/Errors/Failures.dart';
import 'package:NumberTrivia/FEATURES/Domain/Entities/Number_Trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
//import 'package:flutter/cupertino.dart';

import '../Repositories/Number_Trivia_repositories.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  //execute({int number}) async {}

  Future<Either<Failure, NumberTrivia>> execute({@required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }

  /*async {
    return await repository.getConcreteNumberTrivia();
  }*/
}

class Params extends Equatable {
  final int number;

  Params({@required this.number});

  @override
  List<Object> get props => [number];
}
