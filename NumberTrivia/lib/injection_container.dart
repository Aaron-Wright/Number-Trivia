import 'package:get_it/get_it.dart';

import 'FEATURES/Presentation/bloc/number_trivia_bloc.dart';

final sl = GetIt.instance;

void init() {
  //! Features = Number Trivia
  //bloc
  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      inputConverter: sl(),
      random: sl(),
    ));
  //! Core

  //! External
}
