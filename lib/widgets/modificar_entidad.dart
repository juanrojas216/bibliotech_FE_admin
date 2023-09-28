import 'package:bibliotech_admin/widgets/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModificarEntidad<T> extends ConsumerWidget {

  final T entidad;
  final FutureProviderFamily nombreProvider;
  final String mensajeResult;
  final String mensajeError;

  const ModificarEntidad({ required this.entidad, required this.nombreProvider, required this.mensajeResult, required this.mensajeError, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var modificarEntidad = ref.watch(nombreProvider(entidad));

    return modificarEntidad.when(
        data: (_) => ResultDialog(iconDialog: const Icon(Icons.check), messageDialog: mensajeResult),
        error: (_, __) => ResultDialog(iconDialog: const Icon(Icons.error), messageDialog: mensajeError),
        loading: () => const AlertDialog(content: LinearProgressIndicator()),
    );
  }
}