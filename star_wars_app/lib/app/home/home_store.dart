import 'package:mobx/mobx.dart';
import 'package:star_wars_app/data/use_cases/people/get_characters_from_people_list.dart';
import 'package:star_wars_app/dir/dir.dart';
import 'package:star_wars_app/domain/entities/character_model.dart';

part 'home_store.g.dart';

class HomeStore extends _HomeStoreBase with _$HomeStore {}

abstract class _HomeStoreBase with Store {
  final peopleList = getIt.get<GetPeople>();

  bool isFetchData = false;
  int _page = 1;

  @observable
  late ObservableList<CharacterModel> characters = ObservableList<CharacterModel>();

  @action
  Future<void> charactersList() async {
    if (isFetchData) {
      return;
    }

    isFetchData = true;

    var res = await peopleList.getCharacters(page: _page);

    if (res.isNotEmpty) {
      characters.addAll(res);
      _page++;
    }

    isFetchData = false;
  }
}
