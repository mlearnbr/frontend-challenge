import '../../models/homeworld_model.dart';

abstract class GetHomeworldRepository {
  Future<HomeworldModel> getHomeworldRepository(String url);
}
