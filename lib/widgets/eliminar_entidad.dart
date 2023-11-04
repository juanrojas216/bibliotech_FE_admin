

import 'package:bibliotech_admin/widgets/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/helpers/http_result.dart';

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
        error: (response, __) => Visibility(
          visible: (response as HtttpResult).statusCode == 403,
          replacement: ResultDialog(iconDialog: const Icon(Icons.error), messageDialog: mensajeError),
          child: const ResultDialog(iconDialog: Icon(Icons.not_interested_rounded), messageDialog: "ACCESO NO AUTORIZADO"),
        ),
        // error: (_, __) => ResultDialog(iconDialog: const Icon(Icons.error), messageDialog: mensajeError),
        loading: () => const AlertDialog(content: LinearProgressIndicator()),
    );
  }
}