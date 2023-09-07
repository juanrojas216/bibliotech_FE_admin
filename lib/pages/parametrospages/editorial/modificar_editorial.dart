


import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'editorial_controller.dart';

class ModificarEditorialDialog extends ConsumerWidget {

  const ModificarEditorialDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var modificarEditorial = ref.watch(modificarEditorialProvider);

    return AlertDialog(
      title: const Text('Modificando editorial....'),
      content: modificarEditorial.when(
        data: (_) => IgnorePointer(
          child: Center(
            child: DecoratedBox(
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
                    Text('Editorial modificada'),
                  ],
                ),
              ),
            ),
          ),
        ),
        error: (_, __) => IgnorePointer(
          child: Center(
            child: DecoratedBox(
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
                    Text('No se pudo modificar la editorial'),
                  ],
                ),
              ),
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
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