

import 'dart:js_interop';

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenProvider = FutureProvider.family<void, Map<String, String>>((ref, body) async {
  var response = await ref.read(apiProvider).request<Map<String, String>>('/auth/signin',
  body: body);

  if (response.error.isNull) {
    print(response.data!);
  } else {
    print(response.statusCode);
    throw new Error();
  }
});