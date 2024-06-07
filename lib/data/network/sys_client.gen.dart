import 'package:dio/dio.dart';
import 'package:filamentor_app/data/network/api_result.dart';
import 'package:filamentor_app/data/network/models/index.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'sys_client.gen.g.dart';

@singleton
@RestApi(baseUrl: 'sys')
abstract class SysClient {
  @factoryMethod
  static SysClient create(Dio dio) => SysClient(dio);

  factory SysClient(Dio dio) = _SysClient;

  @GET('/config')
  Future<ApiResult<RespConfig>> getConfig();

  @POST('/mqtt_config')
  Future<ApiResult> updateMqttConfig(@Body() RespMqttConfig config);

  @GET('/sync')
  Future<ApiResult<RespSync>> sync();
}
