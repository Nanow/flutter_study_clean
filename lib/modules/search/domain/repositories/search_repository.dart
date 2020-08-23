import 'package:dartz/dartz.dart';
import 'package:study_clean/modules/search/domain/entities/result_search.dart';
import 'package:study_clean/modules/search/domain/errors/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> saerch(String searchText);
}
