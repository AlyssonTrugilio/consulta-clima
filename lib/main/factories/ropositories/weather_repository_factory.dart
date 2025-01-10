import 'package:consultar_clima/core/core.dart';
import 'package:consultar_clima/domain/domain.dart';
import 'package:consultar_clima/infra/infra.dart';

WeatherRepository weatherRepositoryFactory() {
  return WeatherRepositoryImpl(
    client: AppAdpter.client,
    baseUrl: AppConst.baseUrl,
    apiKey: AppConst.apiKey,
  );
}
