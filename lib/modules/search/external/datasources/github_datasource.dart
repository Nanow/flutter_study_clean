import 'package:dio/dio.dart';
import 'package:study_clean/modules/search/domain/errors/errors.dart';
import 'package:study_clean/modules/search/infra/datasource/search_datasource.dart';
import 'package:study_clean/modules/search/infra/models/result_search_model.dart';

extension on String {
  normalize() {
    return this.trim().replaceAll(" ", "+");
  }
}

class GithubDatasource implements SearchDatasource {
  final Dio dio;

  GithubDatasource(this.dio);
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio
        .get("https://api.github.com/search/users?q=${searchText.normalize()}");
    if (response.statusCode == 200) {
      return ResultSearchModel.fromJsonList(response.data['items']);
    } else {
      throw DatasourceError();
    }
  }
}
