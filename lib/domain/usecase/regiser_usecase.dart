import 'package:dartz/dartz.dart';
import 'package:job_application/core/utils/base_usecase.dart';
import 'package:job_application/core/utils/failure.dart';

import '../../data/network/request.dart';
import '../models/models.dart';
import '../repositery/repositery.dart';

class RegiserUsecase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final Repository _repository;

  RegiserUsecase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(RegisterUseCaseInput input) {
    return _repository.register(
       RegisterRequest( input.userName, input.email, input.password, input.confirmPassword));
  }
}

class RegisterUseCaseInput {
  String userName;
  String email;
  String password;
  String confirmPassword;
  RegisterUseCaseInput(
    this.confirmPassword,
    this.email,
    this.password,
    this.userName,
  );
}
