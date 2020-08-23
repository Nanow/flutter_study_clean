import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:study_clean/modules/search/domain/entities/result_search.dart';
import 'package:study_clean/modules/search/domain/errors/errors.dart';
import 'package:study_clean/modules/search/domain/repositories/search_repository.dart';
import 'package:study_clean/modules/search/domain/usecases/search_by_text.dart';

/// Mock da implementação do Search Repository que deve ser instanciado.
class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository: repository);

  test('Ele deve retornar uma lista de ResultSearch', () async {
    /// Quando for chamando o repository.search ele executará esse método
    when(repository.saerch(any)).thenAnswer(
      (realInvocation) async => Right(<ResultSearch>[]),
    );

    final result = await usecase("nanow");

    expect(result, isA<Right>());
    expect(result | null, isA<List<ResultSearch>>());
  });
  test('Ele deve retornar uma exception caso o texto seja inválido', () async {
    /// Quando for chamando o repository.search ele executará esse método
    when(repository.saerch(any)).thenAnswer(
      (realInvocation) async => Right(<ResultSearch>[]),
    );

    var result = await usecase(null);

    expect(result.fold(id, id), isA<FailureSearch>());

    result = await usecase("");
    expect(result.fold(id, id), isA<FailureSearch>());
  });
}
