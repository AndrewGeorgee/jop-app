import 'package:dartz/dartz.dart';
import 'package:job_application/core/utils/base_usecase.dart';
import 'package:job_application/core/utils/failure.dart';
import 'package:job_application/domain/repositery/repositery.dart';

class VerifyUsecas extends BaseUseCase<String, String> {
  final Repository _repository;
  VerifyUsecas(this._repository);
  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.verifyCode(input);
  }
}
