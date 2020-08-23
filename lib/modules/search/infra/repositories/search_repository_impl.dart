import 'package:study_clean/modules/search/domain/errors/errors.dart';
import 'package:study_clean/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:study_clean/modules/search/domain/repositories/search_repository.dart';
import 'package:study_clean/modules/search/infra/datasource/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource datasource;

  SearchRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> saerch(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
