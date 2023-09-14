

import 'package:bibliotech_admin/config/helpers/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<Http>((ref) {
  return Http(baseUrl: 'https://bibliotechdb-default-rtdb.firebaseio.com');
});

// final apiProvider = Provider<Http>((ref) {
//   return Http(baseUrl: 'http://localhost:8080/api/v1');
// });