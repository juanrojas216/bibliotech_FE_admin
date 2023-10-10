import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../create_page/pages/seleccion_usuario.page.dart';

class NuevaMulta extends ConsumerWidget {
  const NuevaMulta({
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
          Text('Nueva multa'),
        ],
      ),
      onPressed: () {
        // ref.read(routesProvider).push('/publicacion/create');
        showCupertinoDialog(context: context, builder: (_) => const SelectUserPage(),);
      },
    );
  }
}