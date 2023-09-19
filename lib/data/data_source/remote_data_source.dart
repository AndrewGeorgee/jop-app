import 'package:job_application/data/responce/responce.dart';

import '../network/api_app/app_api.dart';
import '../network/request.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponce> login(LoginRequest loginRequest);
  Future<AuthenticationResponce> register(RegisterRequest requestReques);
  Future<ForgetPasswordResponce> forgetPAssword(String email);
  Future<ForgetPasswordByPhoneResponce> forgetPAsswordByPhone(String phone);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient appServiceClient;

  RemoteDataSourceImpl(this.appServiceClient);
  @override
  Future<AuthenticationResponce> login(LoginRequest loginRequest) async {
    return await appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }

  @override
  Future<AuthenticationResponce> register(RegisterRequest requestReques) async {
    return await appServiceClient.register(
      requestReques.userName,
      requestReques.email,
      requestReques.password,
      requestReques.confirmPassword,
    );
  }

  @override
  Future<ForgetPasswordResponce> forgetPAssword(String email) async {
    return await appServiceClient.forgetPassword(email);
  }

  @override
  Future<ForgetPasswordByPhoneResponce> forgetPAsswordByPhone(
      String phone) async {
    return await appServiceClient.forgetPasswordByPhone(phone);
  }
}
