import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/data/model/response/RegisterResponse.dart';
import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone);

  Future<Either<BaseError, AuthResultEntity>> login(String email, String password);
}
