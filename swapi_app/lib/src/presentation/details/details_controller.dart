import 'package:get/get.dart';
import 'package:swapi_app/src/data/dtos/people_dto.dart';

class DetailsController extends GetxController {
  final PeopleDto people = Get.arguments['people'] as PeopleDto;
}
