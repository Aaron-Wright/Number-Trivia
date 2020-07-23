import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../CORE/Errors/Failures.dart';
import '../../../CORE/Platform/Network_Info.dart';
import '../../Domain/Entities/Number_Trivia.dart';
import '../../Domain/Repositories/Number_Trivia_repositories.dart';
import '../Data_Sources/number_trivia_local_data_source.dart';
import '../Data_Sources/number_trivia_remote_data_sources.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    networkInfo.isConnected;
    final remoteTrivia = await remoteDataSource.getConcreteNumberTrivia(number);
    localDataSource.cacheNumberTrivia(remoteTrivia);
    return Right(remoteTrivia);
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    return null;
  }
}
