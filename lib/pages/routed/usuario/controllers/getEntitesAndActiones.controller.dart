
import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dto/recursos.dto.dart';

final getEntitiesAndActionsProvider = FutureProvider.autoDispose<Map>((ref) async {
  
  var actions = await ref.watch(apiProvider).request(
        '/actions',
        parser: actionsFromJson,
  );

  if (actions.error != null) {
    throw actions;
  }

  var resources = await ref.watch(apiProvider).request<List<Recurso>>(
        '/resources',
        parser: recursosFromJson,
  );

  if (resources.error != null) {
    throw resources;
  }

  var response  = {
    "actions": actions.data,
    "resources": resources.data,
  };

  return response;
});