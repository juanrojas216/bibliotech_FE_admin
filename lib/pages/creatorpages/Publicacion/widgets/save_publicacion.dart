import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavePublicacion extends ConsumerWidget {
  const SavePublicacion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var guardarPublicacion = ref.watch(guardarPublicacionProvider);

    return AlertDialog(
      content: guardarPublicacion.when(
        data: (_) => DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check),
                SizedBox(height: 5),
                Text('Publicacion actualizada'),
              ],
            ),
          ),
        ),
        error: (_, __) => DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline),
                SizedBox(height: 5),
                Text('Publicacion no actualizada'),
              ],
            ),
          ),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        guardarPublicacion.when(
          data: (_) => TextButton(
              onPressed: () {
                ref.read(routesProvider).pop();
              },
              child: const Text('Aceptar')),
          error: (_, __) => TextButton(
              onPressed: () {
                ref.read(routesProvider).pop();
              },
              child: const Text('Aceptar')),
          loading: () => const SizedBox.shrink(),
        ),
      ],
    );
  }
}
