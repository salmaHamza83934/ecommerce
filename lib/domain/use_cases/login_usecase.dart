import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/data/model/response/RegisterResponse.dart';
import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';
import 'package:ecommerce_app/domain/repository/repository/auth_repository_contract.dart';

class LoginUseCase{
  AuthRepositoryContract authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<BaseError,AuthResultEntity>>invoke( String email,
      String password){
    return authRepository.login(email, password);
  }
}