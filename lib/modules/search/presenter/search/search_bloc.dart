import 'package:bloc/bloc.dart';
import 'package:study_clean/modules/search/domain/usecases/search_by_text.dart';
import 'package:study_clean/modules/search/presenter/search/states/state.dart';

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByText usecase;

  SearchBloc(this.usecase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoad();

    final result = await usecase(searchText);

    yield result.fold(
      (l) => SearchError(l),
      (r) => SearchSucess(r),
    );
  }
}
