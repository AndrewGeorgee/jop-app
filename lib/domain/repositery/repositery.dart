import 'package:dartz/dartz.dart';
import 'package:job_application/domain/models/models.dart';

import '../../core/utils/failure.dart';
import '../../data/network/request.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, String>> forgotPasswordByPhone(String phone);
  Future<Either<Failure, String>> verifyCode(String phone);
}
