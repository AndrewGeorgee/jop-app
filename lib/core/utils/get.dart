import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:job_application/core/utils/app_pre.dart';
import 'package:job_application/core/utils/network_info.dart';
import 'package:job_application/domain/usecase/regiser_usecase.dart';
import 'package:job_application/domain/usecase/verify_use_case.dart';
import 'package:job_application/screen/forget_password/view_model/forget_viewmodel.dart';
import 'package:job_application/screen/verify_code/verify_view_model.dart';
import 'package:pro_shered_preference/pro_shered_preference.dart';

import '../../data/data_source/remote_data_source.dart';
import '../../data/network/api_app/app_api.dart';
import '../../data/network/dio.dart';
import '../../data/repository/repository_impl.dart';
import '../../domain/repositery/repositery.dart';
import '../../domain/usecase/forge_password_by_phone.dart';
import '../../domain/usecase/forget_password_usecase.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../screen/login/view/login_viewModel.dart';
import '../../screen/register/view/register_view_model.dart';

final instance = GetIt.instance;
Future<void> initAppModules() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));

  // instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  // local data source
  // instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // repository

  instance.registerLazySingleton<Repository>(() => RepositoryImp(
        instance(),
        instance(),
      ));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegiserUsecase>()) {
    instance.registerFactory<RegiserUsecase>(() => RegiserUsecase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance()));
  }
}

initForgetPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordByPhoneUseCase>(
        () => ForgotPasswordByPhoneUseCase(instance()));
    instance.registerFactory<ForgetViewModel>(
        () => ForgetViewModel(instance(), instance()));
  }
}

initVerifyCodeModule() {
  if (!GetIt.I.isRegistered<VerifyUsecas>()) {
    instance.registerFactory<VerifyUsecas>(() => VerifyUsecas(instance()));
    instance
        .registerFactory<VerifyViewModel>(() => VerifyViewModel(instance()));
  }
}
