import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_clean_architecture/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:tdd_clean_architecture/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  ///the number trivia model should subclass the number trivia entity
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test test');

  test('the number trivia model should subclass the NumberTrivia entity',
      () async {
    // assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        //simulating the json response
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia.json'));

        // act
        final result = NumberTriviaModel.fromJson(jsonMap);

        // assert
        expect(result, tNumberTriviaModel);
      },
    );

    test(
      'should return a valid model when the JSON number is a double',
      () async {
        // arrange
        //simulating the json response
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia_double.json'));

        // act
        final result = NumberTriviaModel.fromJson(jsonMap);

        // assert
        expect(result, tNumberTriviaModel);
      },
    );
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      // act
      final result = tNumberTriviaModel.toJson();

      // assert
      final expectedJsonMap = {"text": "Test test", "number": 1};
      expect(result, expectedJsonMap);
    });
  });
}
