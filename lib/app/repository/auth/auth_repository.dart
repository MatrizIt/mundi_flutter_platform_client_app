import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/connection_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/invalid_field_exception.dart';
import 'package:mundi_flutter_platform_client_app/app/core/exception/user_already_exists.dart';
import 'package:mundi_flutter_platform_client_app/app/core/rest/rest_client.dart';
import 'package:mundi_flutter_platform_client_app/app/core/storage/local_storage.dart';
import 'package:mundi_flutter_platform_client_app/app/models/user.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final RestClient _rest;
  final LocalStorage localStorage;

  const AuthRepository({
    required RestClient rest, required LocalStorage
  }) : _rest = rest, localStorage = LocalStorage;

  @override
  Future<String> login(String email, String password) async {
    try {
      final response = await _rest.post("/user/login", data: {
        'email': email,
        'password': password,
        "isEntrepreneur": false
      },headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 401) {
        throw InvalidFieldException();
      }

      final accessToken = response.data['access_token'];
      localStorage.write("access_token", accessToken);

      log("TOKEN > ${accessToken}");

      return accessToken;
    } on DioException {
      throw ConnectionException(
          errorMessage: "Erro ao conectar-se com o Servidor");
    }
  }

  @override
  Future<void> register(User user) async {
    try {
      final response = await _rest.post(
        "/user/register",
        data: user.toMap(),
        headers: {
          'Content-Type': 'application/json',
        }
      );

      if (response.data['mensagem'] == "Usuário já cadastrado") {
        throw UserAlreadyExists();
      } else if (response.data['mensagem'] == "Erro ao cadastrar!") {
        throw InvalidFieldException(exception: response.data['mensagem']);
      }
    } on DioException {
      throw ConnectionException(
        errorMessage: "Erro ao conectar-se com o servidor",
      );
    }
  }

  @override
  Future<User> findOneById(int userId) async {
    try {
      final response = await _rest.get("/user/searchById$userId", headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 401) {
        throw InvalidFieldException();
      }

      final userData = User.fromJson(jsonEncode(response.data));
      
      return userData;
    } on DioException {
      throw ConnectionException(
          errorMessage: "Erro ao conectar-se com o Servidor");
    }
  }

  @override
  Future<void> updateUser(int userId, String name, String email, String phone) async {
    try {
      final response = await _rest.put("/user/$userId", data: {
        'name': name,
        'email': email,
        'phone': phone
      },headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 401) {
        throw InvalidFieldException();
      }
    }catch (e){
      print("Error > $e");
    } on DioException {
      throw ConnectionException(
          errorMessage: "Erro ao conectar-se com o Servidor");
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      final response = await _rest.post("/user/reset-password", data: {
        'email': email
      },headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 401) {
        throw InvalidFieldException();
      }

    } on DioException {
      throw ConnectionException(
          errorMessage: "Erro ao conectar-se com o Servidor");
    }
  }

  @override
  Future<void> validateCode(String email, String code) async {
    try {
      final response = await _rest.post("/user/validate-reset-code", data: {
        'email': email,
        'code': code
      },headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 401) {
        throw InvalidFieldException();
      }

    } on DioException {
      throw ConnectionException(
          errorMessage: "Erro ao conectar-se com o Servidor");
    }
  }

  @override
  Future<void> updatePassword(String email, String code, String newPassword) async {
    try {
      final response = await _rest.post("/user/update-password", data: {
        'email': email,
        'code': code,
        'newPassword': newPassword
      },headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 401) {
        throw InvalidFieldException();
      }

    } on DioException {
      throw ConnectionException(
          errorMessage: "Erro ao conectar-se com o Servidor");
    }
  }
}
