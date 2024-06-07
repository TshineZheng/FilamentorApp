import 'package:dio/dio.dart';
import 'package:filamentor_app/data/network/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'controller_client.gen.g.dart';

@singleton
@RestApi(baseUrl: 'controller')
abstract class ControllerClient {
  @factoryMethod
  static ControllerClient create(Dio dio) => ControllerClient(dio);

  factory ControllerClient(Dio dio) = _ControllerClient;

  @POST('/control')
  Future<ApiResult> control(
    @Query('controller_id') String controllerId,
    @Query('channel') int channel,
    @Query('action') int action,
  );

  @POST('/bind_printer')
  Future<ApiResult> bindPrinter(
    @Query('printer_id') String printerId,
    @Query('controller_id') String controllerId,
    @Query('channels') List<int> channel,
  );

  @POST('/unbind_printer')
  Future<ApiResult> unbind(
    @Query('printer_id') String printerId,
    @Query('controller_id') String controllerId,
    @Query('channel') int channel,
  );

  @PUT('/')
  Future<ApiResult> add(
    @Query('alias') String alias,
    @Query('controller_type')String type,
    @Body() Map<String, dynamic> info,
  );

  @DELETE('/')
  Future<ApiResult> remove(@Query('controller_id') String controllerId);
}
