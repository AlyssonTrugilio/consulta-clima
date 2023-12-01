
import 'package:http/http.dart' as http;

import '../../domain/domain.dart';
import '../../infra/infra.dart';

CityRepository cityRepositoryFactory() {
  return CityRepositoryImpl(
    client: http.Client(),
    apiKey: "c93ec169bc7918636f32dc40e73d73d8",
  );
}
