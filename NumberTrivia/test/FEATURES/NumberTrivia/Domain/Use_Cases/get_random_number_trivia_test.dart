import 'package:NumberTrivia/CORE/UseCases/usecase.dart';
import 'package:NumberTrivia/FEATURES/Domain/Entities/Number_Trivia.dart';
import 'package:NumberTrivia/FEATURES/Domain/Repositories/Number_Trivia_repositories.dart';
import 'package:NumberTrivia/FEATURES/Domain/UseCases/get_random_number_trivia.dart';
import 'package:NumberTrivia/FEATURES/Domain/UseCases/getconcretenumbertrivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  test(
    'should get trivia from the repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
