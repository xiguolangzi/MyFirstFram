import 'package:dio/dio.dart';

class DioUtil {
  // 连接超时时间
  static const int connectTimeout = 6 * 1000;
  // 响应超时时间
  static const int receiveTimeout = 6 * 1000;
  // 请求的URL前缀
  static String baseUrl = "http://localhost:8080";
  // 是否开启网络缓存，默认是false
  static bool cacheEnable = false;
  // 最大缓存时间(按秒)，默认最大缓存7天
  static int maxCacheAge = 7 * 24 * 60 * 60;
  // 最大缓存条数，默认100条
  static int maxCacheCount = 100;

  factory DioUtil() => _getInstance();
  static DioUtil get instance => _getInstance();
  static DioUtil _instance;
  final Dio _dio = Dio();

  // 声明 dio 变量
  Dio get dio => _dio;
  // 取消请求token
  CancelToken _cancelToken = CancelToken();
  // cookie
  CookieJar cookieJar = cookieJar();

  DioUtil._init() {
    if (_dio == null) {
      // 初始化基本选项
      BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      );

      // 初始化dio
      _dio = Dio(options);

      // 添加拦截器
      _dio.interceptors.add(DioInterceptors());

      // 添加转换器
      _dio.transformer = DioTransformer();

      // 添加 cookie 管理器
      _dio.interceptors.add(CookieManeger(cookieJar));

      // 刷新cookie拦截器(lock/unlock)
      _dio.interceptors.add(DioTokenInterceptors());
    }
  }

  // 设置htto代理(设置即开启)
  void setProxy({String proxyAddress, bool enable = false}) {}
}
