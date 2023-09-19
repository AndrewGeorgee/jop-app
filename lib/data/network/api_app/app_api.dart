import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../core/utils/constance.dart';
import '../../responce/responce.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST('/customers/login')
  Future<AuthenticationResponce> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST('/customers/forgetPassword')
  Future<ForgetPasswordResponce> forgetPassword(
    @Field('email') String email,
  );

  @POST("/customers/register")
  Future<AuthenticationResponce> register(
      @Field("user_name") String userName,
      @Field("email") String email,
      @Field("password") String password,
      @Field("confirm_Password") String confirmPassword);

  @POST("/customers/ForgetPasswordByPhone")
  Future<ForgetPasswordByPhoneResponce> forgetPasswordByPhone(
    @Field('phone') String phone,
  );
}
