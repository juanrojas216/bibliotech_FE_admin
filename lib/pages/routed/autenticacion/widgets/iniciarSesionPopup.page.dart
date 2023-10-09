import 'package:bibliotech_admin/config/auth/inicio_sesion.dto.dart';
import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IniciarSesion extends ConsumerWidget {
  final InicioSesionDto entidad;
  final AutoDisposeFutureProviderFamily provider;
  final String mensajeResult;
  final String mensajeError;

  const IniciarSesion(
      {required this.entidad,
      required this.provider,
      required this.mensajeResult,
      required this.mensajeError,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var user = ref.watch(provider(entidad));

    return user.when(
      data: (_) {
        return AlertDialog(
          content: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check),
                  const SizedBox(height: 5),
                  Text(mensajeResult),
                ],
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                ref.read(routesProvider).pushReplacement('/publicacion');
              },
              child: const Text('Aceptar'),
            )
          ],
        );
      },
      error: (_, __) => ResultDialog(
          iconDialog: const Icon(Icons.error), messageDialog: mensajeError),
      loading: () => const AlertDialog(content: LinearProgressIndicator()),
    );
  }
}
