import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';
import 'package:ecommerce_app/domain/repository/repository/auth_repository_contract.dart';

class RegisterUseCase{
  AuthRepositoryContract authRepository;

  RegisterUseCase(this.authRepository);

  Future<Either<BaseError,AuthResultEntity>>invoke(String name, String password, String rePassword, String email,
      String phone){
    return authRepository.register(name, password, rePassword, email, phone);
  }
}