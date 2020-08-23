import 'package:study_clean/modules/search/domain/entities/result_search.dart';
import 'package:study_clean/modules/search/domain/errors/errors.dart';

abstract class SearchState {}

class SearchSucess implements SearchState {
  final List<ResultSearch> list;
  SearchSucess(this.list);
}

class SearchLoad implements SearchState {}

class SearchStart implements SearchState {}

class SearchError implements SearchState {
  final FailureSearch error;

  SearchError(this.error);
}
