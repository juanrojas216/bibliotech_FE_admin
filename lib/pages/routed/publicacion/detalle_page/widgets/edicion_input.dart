import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../detalle_controller.dart';
import '../ediciones_controller.dart';

class EdicionInput extends ConsumerWidget {
  const EdicionInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var publicacionDetalle = ref.watch(detallePublicacionProvider);
    var ediciones = ref.watch(edicionesProvider);

    return ediciones.when(
      skipLoadingOnRefresh: false,
        data: (data) => DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<int>(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                isDense: true,
                isExpanded: true,
                hint: const Text('EDICIÓN'),
                value: publicacionDetalle.edicion!.id,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                items: [
                  ...data.map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(
                        e.titulo,
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(detallePublicacionProvider.notifier)
                        .actualizarEdicion(data.where((e) => e.id == value).first);
                  }
                },
              ),
            ),
        error: (_, __) => ElevatedButton(
              onPressed: () {
                ref.invalidate(edicionesProvider);
              },
              child: Text(
                'Reintentar cargar ediciones',
                style: GoogleFonts.poppins(),
              ),
            ),
        loading: () => const LinearProgressIndicator());
  }
}
