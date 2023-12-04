
import '../entities/entities.dart';
abstract interface class CityRepository {
 Future <List<CityEntity>> searchByname({required String search});
}
