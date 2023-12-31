import 'package:dartz/dartz.dart';
import 'package:job_application/domain/repositery/repositery.dart';

import '../../core/utils/base_usecase.dart';
import '../../core/utils/failure.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String> {
  final Repository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgotPassword(input);
  }
}
