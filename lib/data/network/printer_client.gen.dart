import 'package:dio/dio.dart';
import 'package:filamentor_app/data/network/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'printer_client.gen.g.dart';

@singleton
@RestApi(baseUrl: 'printer')
abstract class PrinterClient {
  @factoryMethod
  static PrinterClient create(Dio dio) => PrinterClient(dio);

  factory PrinterClient(Dio dio) = _PrinterClient;

  @DELETE('/')
  Future<ApiResult> remove(
    @Query('printer_id') String printerId,
  );

  @PUT('/')
  Future<ApiResult> add(
    @Query('alias') String alias,
    @Query('change_temp') int changeTemp,
    @Query('type') String type,
    @Body() Map<String, dynamic> info,
  );

  @POST('/set_channel')
  // ignore: non_constant_identifier_names
  Future<ApiResult> setFilaCur(
    @Query('printer_id') String printerId,
    @Query('channel_index') int filaCur,
  );

  @POST('/set_change_temp')
  // ignore: non_constant_identifier_names
  Future<ApiResult> setFilaChangeTemp(
    @Query('printer_id') String printerId,
    @Query('change_temp') int changeTemp,
  );

  @POST('/edit_channel_filament_setting')
  Future<ApiResult> editChannelFilament(
    @Query('printer_id') String printerId,
    @Query('channel_index') int channelIndex,
    @Query('filament_type') String filamentType,
    @Query('filament_color') String filamentColor,
  );
}
