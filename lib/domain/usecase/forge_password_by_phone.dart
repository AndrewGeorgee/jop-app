import 'package:dartz/dartz.dart';

import '../../core/utils/base_usecase.dart';
import '../../core/utils/failure.dart';
import '../repositery/repositery.dart';

class ForgotPasswordByPhoneUseCase implements BaseUseCase<String, String> {
  final Repository _repository;

  ForgotPasswordByPhoneUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async {
    return await _repository.forgotPasswordByPhone(input);
  }
}
