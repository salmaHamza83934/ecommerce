import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api/api_constants.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/data/model/request/registerRequest.dart';
import 'package:ecommerce_app/data/model/response/LoginResponse.dart';
import 'package:ecommerce_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

import '../model/request/LoginRequest.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  //https://ecommerce.routemisr.com/api/v1/auth/signup

  Future<Either<BaseError, RegisterResponse>> register(String name,
      String password, String rePassword, String email, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
      var requestBody = RegisterRequest(
          email: email,
          name: name,
          password: password,
          rePassword: rePassword,
          phone: phone);
      var response = await http.post(url, body: requestBody.toJson());
      var registerResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(BaseError(
            errMsg: registerResponse.error != null
                ? registerResponse.error!.msg!
                : registerResponse.message??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }

  Future<Either<BaseError, LoginResponse>> login(String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
      var loginBody = LoginRequest(
          email: email,
          password: password);
      var response = await http.post(url, body: loginBody.toJson());
      var loginResponse =
      LoginResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(BaseError(
            errMsg: loginResponse.message??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }
}
