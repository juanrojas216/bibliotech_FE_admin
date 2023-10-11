import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/crearUsuario.page.dart';

class NuevoUsuario extends ConsumerWidget {
  const NuevoUsuario({
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
          Text('Nuevo usuario'),
        ],
      ),
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (context) => const UsuarioAdd(),
        );
      },
    );
  }
}
