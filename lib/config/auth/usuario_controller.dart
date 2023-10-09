import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/use_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth.service.dart';


final usuarioProvider = FutureProvider<void>((ref) async {
  
  var response = await ref.watch(apiProvider).request(
      '/users/get-active-user-info',
      method: HttpMethod.get,
      parser: userInfoFromJson,
  );

  Auth.name = '${response.data!.firstName} ${response.data!.lastName}';
  Auth.roles = response.data!.roles.map((e) => e.roleName).toList();

});
