import 'package:dartz/dartz.dart';
import 'package:job_application/core/utils/failure.dart';
import 'package:job_application/data/network/request.dart';
import 'package:job_application/domain/models/models.dart';

import '../../core/utils/base_usecase.dart';
import '../repositery/repositery.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput , Authentication> {
final  Repository _repository;

  LoginUseCase(this._repository, );

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput  input) {
    return _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput  {
  String email;
  String password;
  LoginUseCaseInput (this.email, this.password);
}
