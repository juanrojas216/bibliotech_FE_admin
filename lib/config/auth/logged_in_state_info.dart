import 'dart:js_interop';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

final loggedInProvider = StateProvider((ref) {
  final data = storage.read(key: 'jwt');
  return !data.isNull;
});
