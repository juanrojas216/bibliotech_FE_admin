import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final usuarioProvider = FutureProvider<UserModel>((ref) async {
  await Future.delayed(const Duration(seconds: 1));

  var response = await ref.watch(apiProvider).request<UserModel>(
      '/usuarios/0.json',
      method: HttpMethod.get,
      parser: userModelFromJson);

  if (response.error != null) {
    print(response.error!.exception);
  }

  return response.data!;
});
