import 'package:dio/dio.dart';
import 'package:filamentor_app/data/storage.gen.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_router.dart';
import 'locator.gen.config.dart';

GetIt gain = GetIt.instance;

/// 前台专用注入注解，给前台专用的对象加上这个注解，后台就不会自动注入了，可以节省内存
///
/// 实际上, 如果不是lazySingleton, 还是会被注册, 只不过不能获取, 也就是说如果注册的对象有逻辑, 但只是singleton, 在后台依然还是会执行这部分逻辑
const appInject = Environment('app_inject');

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future configureDependencies([String? env]) => $initGetIt(gain, environment: env);

@module
abstract class RegisterModule {
  @singleton
  AppRouter get appRouter => AppRouter();

  @preResolve
  Future<SharedPreferences> prefs() async => await SharedPreferences.getInstance();

  @singleton
  Dio dio(Storage storage) {
    final dio = Dio();
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 对所有请求参数进行 UTF-8 编码
        // options.queryParameters.forEach((key, value) {
        //   if (value is String) {
        //     options.queryParameters[key] = Uri.encodeFull(value);
        //   }
        // });
        return handler.next(options); // 继续执行请求
      },
    ));
    return dio;
  }
}
