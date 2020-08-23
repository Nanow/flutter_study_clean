import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_clean/app_module.dart';
import 'package:study_clean/modules/search/domain/entities/result_search.dart';
import 'package:study_clean/modules/search/presenter/search/search_bloc.dart';
import 'package:study_clean/modules/search/presenter/search/states/state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: TextField(
              onChanged: bloc.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Search",
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<SearchState>(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc.state;

                  if (state is SearchLoad) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SearchStart) {
                    return Center(
                      child: Text('Digite um texto'),
                    );
                  }
                  if (state is SearchError) {
                    return Center(
                      child: Text('Digite um texto ${state.error.toString()}'),
                    );
                  }
                  final list = (state as SearchSucess).list;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return ListTile(
                        title: Text(item.title),
                        leading: item.img == null
                            ? Container()
                            : CircleAvatar(
                                backgroundImage: NetworkImage(item.img),
                              ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
