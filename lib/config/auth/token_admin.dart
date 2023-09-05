

import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenProvider = StateProvider<String>((ref) {
  return '';
});

final tokenRepositoryProvider = Provider<String>((ref) => ref.watch(tokenProvider) );