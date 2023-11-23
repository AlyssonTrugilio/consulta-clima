import 'city_entity.dart';

abstract class CityRepository {
 Future <List<CityEntity>> searchByname({required String search});
}
