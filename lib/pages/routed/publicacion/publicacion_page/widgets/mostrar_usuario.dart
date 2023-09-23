import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/publicacion_page/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MostrarUsuario extends ConsumerWidget {
  const MostrarUsuario({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(usuarioProvider);

    return user.when(
        data: (data) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 36,
                ),
                const SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  'Hola, ${data.nombre}',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
        error: (_, __) =>
            const Text("Error", style: TextStyle(color: Colors.black)),
        loading: () => const CircularProgressIndicator());
  }
}
