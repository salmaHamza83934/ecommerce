import 'package:ecommerce_app/data/api/api_manager.dart';
import 'package:ecommerce_app/data/repository/data_source/auth_remote_data_source_imp.dart';
import 'package:ecommerce_app/data/repository/repository/auth_repository_imp.dart';
import 'package:ecommerce_app/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/repository/auth_repository.dart';
import 'package:ecommerce_app/domain/use_cases/login_usecase.dart';
import 'package:ecommerce_app/domain/use_cases/register_usecase.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(injectAuthRepository());
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(injectAuthRepository());
}
AuthRepository injectAuthRepository(){
  return AuthRepositoryImp(injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImp(apiManager: ApiManager.getInstance());
}