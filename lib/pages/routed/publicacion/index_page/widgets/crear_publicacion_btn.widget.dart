


import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NuevaPublicacion extends ConsumerWidget {
  const NuevaPublicacion({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Row(
        children: [
          Icon(Icons.add),
          SizedBox(
            width: 10,
          ),
          Text('Nueva publicación'),
        ],
      ),
      onPressed: () {
        ref.read(routesProvider).push('/publicacion/create');
      },
    );
  }
}
