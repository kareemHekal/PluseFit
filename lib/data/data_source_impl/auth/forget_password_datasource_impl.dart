
import 'package:fit_zone/core/api/api_result.dart';
import 'package:fit_zone/core/api/endpoints.dart';
import 'package:fit_zone/data/data_source_contract/auth/forget_password_datasource.dart';
import 'package:fit_zone/data/model/forget_pass_response.dart';
import 'package:fit_zone/data/model/otp_response.dart';
import 'package:fit_zone/data/model/reset_password_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_excuter.dart';
import '../../../core/api/api_manager.dart';
@Injectable(as: ForgetPasswordDatasource)
class ForgetPasswordDatasourceImpl extends ForgetPasswordDatasource {
  final ApiManager apiManager;
  ForgetPasswordDatasourceImpl(this.apiManager);

   @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword({
    required String email,
  }) async {
    final apiResult = await executeApi(() async {
      final response = await apiManager.postRequest(
        endpoint: EndPoint.forgetPasswordEndpoint,
        body: {
          'email': email
        },
        headers: {'Content-Type': 'application/json'},
      );
      return response.data;
    });

    if (apiResult is SuccessApiResult) {
      final result = ForgetPasswordResponse.fromJson(apiResult.data);
      return SuccessApiResult(result); // ✅ تمام كده
    } else if (apiResult is ErrorApiResult) {
      return ErrorApiResult(apiResult.exception);
    } else {
      return ErrorApiResult(Exception('Unknown error'));
    }
  }

  @override
  Future<ApiResult<OtpResponse>> verifyResetCode({required String resetCode})async {
   final apiResult= await executeApi(() async{
     final response=await apiManager.postRequest(
         endpoint: EndPoint.verifyResetCode,
       body:{
         "resetCode":resetCode,
       },
       headers: {'Content-Type': 'application/json'},
     );
     return response.data;
   },);
   if(apiResult is SuccessApiResult){
     final result = OtpResponse.fromJson(apiResult.data);
     return SuccessApiResult(result); // ✅
   }else if (apiResult  is ErrorApiResult){
     return ErrorApiResult(apiResult.exception);
   }else {
     return ErrorApiResult(Exception('Unknown error'));
   }
  }

  @override
  Future<ApiResult<ResetPasswordResponse>> resetPassword({required String email, required String newPassword})async {
    final apiResult=await executeApi(() async{
      final response = await apiManager.put(
        endpoint: EndPoint.resetPassword,
        data: {
          "email": email,
          "newPassword": newPassword,
        },
        headers: {'Content-Type': 'application/json'},
      );

      return response.data;
    },);
    if(apiResult is SuccessApiResult){
      final result=ResetPasswordResponse.fromJson(apiResult.data);
      return SuccessApiResult(result);
    }else if(apiResult is ErrorApiResult){
      return ErrorApiResult(apiResult.exception);
    }else {
      return ErrorApiResult(Exception('Unknown error'));
    }
  }

}
