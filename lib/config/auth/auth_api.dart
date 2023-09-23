import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bibliotech_admin/config/helpers/http.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/config/helpers/login_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class AuthAPI {
  final Http _http;

  AuthAPI(this._http);
  Future<LoginResponse> login(String email, String password) async {
    try {
      final result = await _http.request<String>(
        '/api/login',
        method: HttpMethod.post,
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        parser: (data) {
          return data['token'];
        },
      );
      //print('result data ${result.data}');
      //print('result data runtimeType ${result.data.runtimeType}');
      //print('result data error ${result.error!.data}');
      //print('result data statusCode ${result.statusCode}');

      if (result.error == null) {
        await storage.write(key: "jwt", value: result.data);
        return LoginResponse.ok;
      }

      if (result.statusCode == 400) {
        return LoginResponse.accessDenied;
      }

      if (result.error!.exception is SocketException ||
          result.error!.exception is TimeoutException) {
        return LoginResponse.networkError;
      }
    } catch (e) {
      rethrow;
    }
    return LoginResponse.unknownError;
  }
}
