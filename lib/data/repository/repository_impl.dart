import 'package:dartz/dartz.dart';
import 'package:job_application/core/utils/failure.dart';
import 'package:job_application/core/utils/network_info.dart';
import 'package:job_application/data/data_source/remote_data_source.dart';
import 'package:job_application/data/mapper/mapper.dart';
import 'package:job_application/data/network/request.dart';
import 'package:job_application/domain/models/models.dart';

import '../../core/utils/error.dart';
import '../../domain/repositery/repositery.dart';

class RepositoryImp implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImp(this._networkInfo, this._remoteDataSource);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.statuse == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response.toDomain());
        } else {
          // failure --return business error
          // return either left
          // print()
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.register(registerRequest);

        if (response.statuse == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response.toDomain());
        } else {
          // failure --return business error
          // return either left
          // print()
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.forgetPAssword(email);

        if (response.statuse == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response.toDomain());
        } else {
          // failure --return business error
          // return either left
          // print()
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPasswordByPhone(String phone) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.forgetPAsswordByPhone(phone);

        if (response.statuse == ApiInternalStatus.SUCCESS) {
          // success
          // return either right
          // return data

          return Right(response.toDomain());
        } else {
          // failure --return business error
          // return either left
          // print()
          return Left(Failure(ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
