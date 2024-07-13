import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';
import 'package:ecommerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String password, String rePassword, String email, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(String email, String password) {
    // TODO: implement login
    return remoteDataSource.login(email, password);
  }
}
