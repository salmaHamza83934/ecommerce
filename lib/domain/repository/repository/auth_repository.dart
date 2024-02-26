import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';
import '../../../data/api/base_error.dart';

abstract class AuthRepository {
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String password, String rePassword, String email, String phone);

  Future<Either<BaseError, AuthResultEntity>> login(String email, String password);
}