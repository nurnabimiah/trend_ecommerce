import 'package:dio/dio.dart';
import '../../../utils/app_constants.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../model/base_model/api_response.dart';


class OtpRepo {
  final DioClient dioClient;

  OtpRepo({required this.dioClient});

  Future<ApiResponse> otp(var data) async {
    try {
      Response response = await dioClient.post(
        AppConstants.baseUrl+AppConstants.otp,
        data: data,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }
}