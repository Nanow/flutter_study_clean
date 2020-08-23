import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:study_clean/modules/search/domain/entities/result_search.dart';
import 'package:study_clean/modules/search/domain/errors/errors.dart';
import 'package:study_clean/modules/search/domain/usecases/search_by_text.dart';
import 'package:study_clean/modules/search/presenter/search/search_bloc.dart';
import 'package:study_clean/modules/search/presenter/search/states/state.dart';

class SearchByTextMock extends Mock implements SearchByText {}

main() {
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);

  test('Deve retornar os estados na ordem correta', () {
    when(usecase(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoad>(),
          isA<SearchSucess>(),
        ]));
    bloc.add("Nanow");
  });
  test('Deve retornar um error', () {
    when(usecase(any)).thenAnswer((_) async => Left(InvalidTextError()));
    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoad>(),
          isA<SearchError>(),
        ]));
    bloc.add("Nanow");
  });
}
