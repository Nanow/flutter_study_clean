import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:study_clean/modules/search/domain/errors/errors.dart';
import 'package:study_clean/modules/search/infra/datasource/search_datasource.dart';
import 'package:study_clean/modules/search/infra/models/result_search_model.dart';
import 'package:study_clean/modules/search/infra/repositories/search_repository_impl.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test('deve retornar uma lista de result search', () async {
    when(datasource.getSearch(any))
        .thenAnswer((realInvocation) async => <ResultSearchModel>[]);
    final result = await repository.saerch("Nanow");
    expect(result | null, isA<List<ResultSearchModel>>());
  });
  test('deve retornar um error se o datasource falhar', () async {
    /// Deve retornar um error de datasource
    when(datasource.getSearch(any)).thenThrow(Exception());
    final result = await repository.saerch("Nanow");
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
