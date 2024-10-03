import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

/// GetConcreteNumberTrivia use case.
///
/// Uses [NumberTriviaRepository] to get concrete number trivia.
class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  /// Get concrete number trivia from the repository.
  ///
  /// @param number - The number for which the trivia should be fetched.
  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

/// Params for [GetConcreteNumberTrivia] use case.
///
/// Contains the number for which the trivia should be fetched.
class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object> get props => [number];
}
