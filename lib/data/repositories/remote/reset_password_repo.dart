import 'package:dio/dio.dart';
import '../../../utils/app_constants.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../model/base_model/api_response.dart';


class ResetPasswordRepo {
  final DioClient dioClient;

  ResetPasswordRepo({required this.dioClient});

  Future<ApiResponse> resetPassword(var data) async {
    try {
      Response response = await dioClient.patch(
        AppConstants.baseUrl+AppConstants.resetPassword,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }
}