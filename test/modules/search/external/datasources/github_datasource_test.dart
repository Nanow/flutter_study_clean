import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:study_clean/modules/search/domain/errors/errors.dart';
import 'package:study_clean/modules/search/external/datasources/github_datasource.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);
  test('Deve retornar uma lista de result model', () async {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        data: jsonDecode(GITHUB_RESULT),
        statusCode: 200,
      ),
    );

    final future = datasource.getSearch("Nanow");
    expect(future, completes);
  });
  test('Deve retornar um datasource Error se o código não for 200', () async {
    when(dio.get(any)).thenAnswer(
      (_) async => Response(
        data: null,
        statusCode: 401,
      ),
    );

    final future = datasource.getSearch("Nanow");
    expect(future, throwsA(isA<DatasourceError>()));
  });
}
