import 'package:NumberTrivia/FEATURES/Data/Data_Sources/number_trivia_remote_data_sources.dart';
import 'package:NumberTrivia/FEATURES/Domain/Repositories/Number_Trivia_repositories.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CORE/Network/Network_Info.dart';
import 'CORE/utils/input_converter.dart';
import 'FEATURES/Data/Data_Sources/number_trivia_local_data_source.dart';
import 'FEATURES/Data/Repositories/number_trivia_repository_impl.dart';
import 'FEATURES/Domain/UseCases/get_random_number_trivia.dart';
import 'FEATURES/Domain/UseCases/getconcretenumbertrivia.dart';
import 'FEATURES/Presentation/bloc/number_trivia_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Features = Number Trivia
  //bloc
  sl.registerFactory(
    () => NumberTriviaBloc(
      concrete: sl(),
      inputConverter: sl(),
      random: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
        localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
      () => NumberTriviaRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
      () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferneces = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferneces);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
