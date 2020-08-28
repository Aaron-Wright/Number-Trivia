import 'dart:convert';

import 'package:NumberTrivia/CORE/Errors/Exceptions.dart';
import 'package:NumberTrivia/FEATURES/Data/Data_Sources/number_trivia_local_data_source.dart';
import 'package:NumberTrivia/FEATURES/Data/Models/number_trivia_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matcher/matcher.dart';

import '../../../../FIXTURES/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  NumberTriviaLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = NumberTriviaLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group(('getLastNumberTrivia'), () {
    final tNumberTriviaModel =
        NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));
    test(
        'should return NumberTrivia from SharedPreferences when there is one in the cache',
        () async {
      // ARRANGE
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('trivia_cached.json'));
      // ACT
      final result = await dataSource.getLastNumberTrivia();
      //ASSERT
      verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA));
      expect(result, equals(tNumberTriviaModel));
    });

    test('should throw a CacheException when there is not a cached value',
        () async {
      // ARRANGE
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // ACT
      final call = dataSource.getLastNumberTrivia; //();
      // ASSERT
      expect(
          () => call(),
          throwsA(TypeMatcher<
              CacheException>())); //calling method from a high-order function
    });
  });

  group(('cacheNumberTrivia'), () {
    final tNumberTriviaModel =
        NumberTriviaModel(number: 1, text: 'test trivia');
    test(
      'should call SharedPreferences to cache the data',
      () async {
        // act
        dataSource.cacheNumberTrivia(tNumberTriviaModel);
        // assert
        final expectedJsonString = json.encode(tNumberTriviaModel.toJson());
        verify(mockSharedPreferences.setString(
            CACHED_NUMBER_TRIVIA, expectedJsonString));
      },
    );
  });
}
