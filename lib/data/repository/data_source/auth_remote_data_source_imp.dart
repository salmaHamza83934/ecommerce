import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/api_manager.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/data/model/response/RegisterResponse.dart';
import 'package:ecommerce_app/domain/entities/auth_result_entity.dart';
import '../../../domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, password, rePassword, email, phone);
    return either.fold((error) => Left(BaseError(errMsg: error.errMsg)), (response) => Right(response.toAuthResultEntity()));
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(String email, String password) async{
    // TODO: implement login
    var either =
        await apiManager.login(email, password);
    return either.fold((error) => Left(BaseError(errMsg: error.errMsg)), (response) => Right(response.toAuthResultEntity()));
  }
  }

