


import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/edicion/edicion_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ModificarEdicionDialog extends ConsumerWidget {

  const ModificarEdicionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var modificarEdicion = ref.watch(modificarEdicionProvider);

    return AlertDialog(
      title: const Text('Modificando edición....'),
      content: modificarEdicion.when(
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
                Text('Edición modificada'),
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
                Icon(Icons.error),
                SizedBox(height: 5),
                Text('No se pudo modificar la edición'),
              ],
            ),
          ),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            ref.read(routesProvider).pop();
          },
          child: const Text('Aceptar'),
        )
      ],
    );
  }
}