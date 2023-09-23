import 'package:bibliotech_admin/config/auth/auth_api.dart';
import 'package:bibliotech_admin/config/helpers/login_response.dart';
import 'package:bibliotech_admin/repositories/auth_repository.dart';
import 'package:bibliotech_admin/repositories/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../config/helpers/http.dart';

const storage = FlutterSecureStorage();

@override
bool loginFunc(String user, String password) {
  final http = Http(baseUrl: 'https://reqres.in');

  final AuthenticationRepository auth =
      AuthenticationRepositoryImpl(AuthAPI(http));

  //auth.login("eve.holt@reqres.in", "cityslicka").then((value) => print(value));
  var res = auth.login(user, password).then((value) => print(value));
  return (res == LoginResponse.ok);
}

//Acceder a token guardado local
final tokenProvider = FutureProvider((ref) async {
  final value = await storage.read(key: 'jwt');
  //print(value);
  return value;
});
