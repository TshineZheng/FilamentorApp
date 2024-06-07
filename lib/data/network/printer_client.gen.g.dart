// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer_client.gen.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PrinterClient implements PrinterClient {
  _PrinterClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'printer';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResult<dynamic>> remove(String printerId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'printer_id': printerId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResult<dynamic>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResult<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<ApiResult<dynamic>> add(
    String alias,
    int changeTemp,
    String type,
    Map<String, dynamic> info,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'alias': alias,
      r'change_temp': changeTemp,
      r'type': type,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(info);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResult<dynamic>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResult<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<ApiResult<dynamic>> setFilaCur(
    String printerId,
    int filaCur,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'printer_id': printerId,
      r'channel_index': filaCur,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResult<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/set_channel',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResult<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<ApiResult<dynamic>> setFilaChangeTemp(
    String printerId,
    int changeTemp,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'printer_id': printerId,
      r'change_temp': changeTemp,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResult<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/set_change_temp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResult<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  @override
  Future<ApiResult<dynamic>> editChannelFilament(
    String printerId,
    int channelIndex,
    String filamentType,
    String filamentColor,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'printer_id': printerId,
      r'channel_index': channelIndex,
      r'filament_type': filamentType,
      r'filament_color': filamentColor,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResult<dynamic>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/edit_channel_filament_setting',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResult<dynamic>.fromJson(
      _result.data!,
      (json) => json as dynamic,
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
