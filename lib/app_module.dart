import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_clean/app_widget.dart';
import 'package:study_clean/modules/search/domain/usecases/search_by_text.dart';
import 'package:study_clean/modules/search/external/datasources/github_datasource.dart';
import 'package:study_clean/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:study_clean/modules/search/presenter/search/search_bloc.dart';
import 'package:study_clean/modules/search/presenter/search/search_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => SearchByTextImpl(repository: i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => GithubDatasource(i())),
        Bind((i) => SearchBloc(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SearchPage()),
      ];
  @override
  Widget get bootstrap => AppWidget();
}
