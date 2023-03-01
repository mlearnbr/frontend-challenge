import 'package:get/get.dart';

import '../../core/utils/app_images.dart';
import '../../data/models/films_model.dart';
import '../../data/models/people_model.dart';
import '../../data/repositories/get_films/get_films_repository_impl.dart';
import '../../data/repositories/get_people/get_people_repository_impl.dart';

class FilmsController extends GetxController {
  final repositoryFilms = GetFilmsRepositoryImpl();
  RxList<FilmsModel> filmsList = <FilmsModel>[].obs;

  final repositoryPeople = GetPeopleRepositoryImpl();
  Rx<PeopleModel> peopleModel = PeopleModel(
    name: '',
    birthYear: '',
    eyeColor: '',
    gender: '',
    hairColor: '',
    height: '',
    homeworld: '',
    mass: '',
    skinColor: '',
    species: [],
    films: [],
  ).obs;

  RxString thumbnail = ''.obs;

  @override
  onInit() async {
    super.onInit();

    getFilmsCatalog('');
  }

  Future<List<FilmsModel>> getFilmsCatalog(String title) async {
    return filmsList.value =
        await repositoryFilms.getFilmsCatalogRepository(title);
  }

  Future<PeopleModel> getPeopleCatalog(String people) async {
    peopleModel.value =
        await repositoryPeople.getPeopleCatalogRepository(people);

    return peopleModel.value;
  }

  thumbnailFilms(FilmsModel films) {
    switch (films.title) {
      case "A New Hope":
        thumbnail.value = AppImages.newHope;
        break;
      case "The Empire Strikes Back":
        thumbnail.value = AppImages.empireStrikes;
        break;
      case "Return of the Jedi":
        thumbnail.value = AppImages.returnJedi;
        break;
      case "The Phantom Menace":
        thumbnail.value = AppImages.phantomMenace;
        break;
      case "Attack of the Clones":
        thumbnail.value = AppImages.atackClone;
        break;
      case "Revenge of the Sith":
        thumbnail.value = AppImages.revengeSith;
        break;
    }
  }
}
