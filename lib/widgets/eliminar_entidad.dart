

import 'package:bibliotech_admin/widgets/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EliminarEntidad extends ConsumerWidget {

  final FutureProvider nombreProvider;
  final String mensajeResult;
  final String mensajeError;
  
  
  const EliminarEntidad({ required this.nombreProvider, required this.mensajeResult, required this.mensajeError, super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var eliminarEntidad = ref.watch(nombreProvider);

    return eliminarEntidad.when(
        data: (_) => ResultDialog(iconDialog: const Icon(Icons.check), messageDialog: mensajeResult),
        error: (_, __) => ResultDialog(iconDialog: const Icon(Icons.error), messageDialog: mensajeError),
        loading: () => const AlertDialog(content: LinearProgressIndicator()),
    );
  }
}