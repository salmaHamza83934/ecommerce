import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/cach_helper/cach_helper.dart';
import 'package:ecommerce_app/data/api/api_constants.dart';
import 'package:ecommerce_app/data/api/base_error.dart';
import 'package:ecommerce_app/data/model/request/registerRequest.dart';
import 'package:ecommerce_app/data/model/response/AddToCartResponseDto.dart';
import 'package:ecommerce_app/data/model/response/CategoryOrBrandsResponseDto.dart';
import 'package:ecommerce_app/data/model/response/GetCartResponseDto.dart';
import 'package:ecommerce_app/data/model/response/LoginResponse.dart';
import 'package:ecommerce_app/data/model/response/RegisterResponse.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:http/http.dart' as http;

import '../model/request/LoginRequest.dart';
import '../model/response/ProductResponseDto.dart';

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  ///Authorization APIs

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


  ///Home APIs
  Future<Either<BaseError, CategoryOrBrandsResponseDto>> getCategories() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.categoryApi);
      var response = await http.get(url);
      var categoryResponse =
      CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(BaseError(
            errMsg: categoryResponse.message??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }

  Future<Either<BaseError, CategoryOrBrandsResponseDto>> getBrands() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.brandsApi);
      var response = await http.get(url);
      var brandsResponse =
      CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandsResponse);
      } else {
        return Left(BaseError(
            errMsg: brandsResponse.message??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }

  Future<Either<BaseError, ProductResponseDto>> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.productsApi);
      var response = await http.get(url);
      var productResponse =
      ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(BaseError(
            errMsg: productResponse.message??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }

  Future<Either<BaseError, AddToCartResponseDto>> addToCart(String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartApi);
      var response = await http.post(url,body: {
        "productId":productId,
      },headers: {
        'token':CacheHelper.getData(key: 'token'),
      });
      var addToCartResponse =
      AddToCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else {
        return Left(BaseError(
            errMsg: addToCartResponse.message??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }

  Future<Either<BaseError, GetCartResponseDto>> getCartItems() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartApi);
      var response = await http.get(url,headers: {
        'token':CacheHelper.getData(key: 'token'),
      });
      var getCartResponseDto =
      GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponseDto);
      } else {
        return Left(BaseError(
            errMsg: getCartResponseDto.status??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }

  Future<Either<BaseError, GetCartResponseDto>> deleteCartItems(String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, "${ApiConstants.addToCartApi}/$productId");
      var response = await http.delete(url,headers: {
        'token':CacheHelper.getData(key: 'token'),
      });
      var deleteCartResponseDto =
      GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteCartResponseDto);
      } else {
        return Left(BaseError(
            errMsg: deleteCartResponseDto.status??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }

  Future<Either<BaseError, GetCartResponseDto>> updateCountCart(String productId,int count) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, "${ApiConstants.addToCartApi}/$productId");
      var response = await http.put(url,body: {
        'count':count.toString()
      },headers: {
        'token':CacheHelper.getData(key: 'token'),
      });
      var updateCartResponseDto =
      GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCartResponseDto);
      } else {
        return Left(BaseError(
            errMsg: updateCartResponseDto.status??''));
      }
    } else {
      return Left(BaseError(errMsg: 'Check Internet Connection'));
    }
  }




}
