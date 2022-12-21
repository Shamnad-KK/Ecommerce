import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/helpers/token_manager.dart';
import 'package:ecommerce/model/auth_token_model.dart';

class DioInterceptor {
  static final DioInterceptor _instance = DioInterceptor._internal();

  factory DioInterceptor() {
    return _instance;
  }

  DioInterceptor._internal();

  TokenManager tokenManager = TokenManager();

  Dio dio = Dio();

  Future<Dio> getDioInstance() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? accessToken = await tokenManager.getAccessToken();
          dio.interceptors.clear();
          options.headers.addAll(
            {"Authorization": "Bearer $accessToken"},
          );
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.response != null) {
            if (e.response!.statusCode == 403 &&
                e.response!.data["message"] == "Forbidden") {
              RequestOptions requestOptions = e.requestOptions;
              try {
                final refreshToken = await tokenManager.getRefreshToken();
                final options = Options(method: requestOptions.method);
                dio.options.headers['refresh'] = "Bearer $refreshToken";
                final Response response = await dio.get(
                  "​http://${AppUrls.host}:6000/api/v1/auth/refresh",
                  options: options,
                );
                if (response.statusCode == 200) {
                  //Deleting the current saved tokens for replacing with the new ones
                  tokenManager.deleteTokens();
                  //Getting the new recieved tokens from the AuthRefresh API call
                  AuthTokenModel authTokenModel =
                      AuthTokenModel.fromJson(response.data);
                  //Saving the new tokens once more
                  tokenManager.setTokens(
                    refreshToken: authTokenModel.refreshToken,
                    accessToken: authTokenModel.accessToken,
                  );
                }
              } catch (e) {
                AppExceptions.handleError(e);
              }

              try {
                //Getting the new access token for making API calls
                final accessToken = await tokenManager.getAccessToken();

                final options = Options(method: requestOptions.method);
                //Correcting the header to Authorization which we changed to refresh for getting the new tokens if expired
                dio.options.headers["Authorization"] = "Bearer $accessToken";
                //Sending request with the new things
                Response response = await dio.request(
                  requestOptions.path,
                  options: options,
                  cancelToken: requestOptions.cancelToken,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                );
                return handler.resolve(response);
              } catch (e) {
                AppExceptions.handleError(e);
              }
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
    return dio;
  }
}
