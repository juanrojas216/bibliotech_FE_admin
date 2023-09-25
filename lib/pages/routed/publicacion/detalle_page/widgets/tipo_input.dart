import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../detalle_controller.dart';
import '../tipos_controller.dart';

class TipoInput extends ConsumerWidget {
  const TipoInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var publicacionDetalle = ref.watch(detallePublicacionProvider);
    var tiposPublicacion = ref.watch(tiposProvider);
    
    return tiposPublicacion.when(
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
                hint: const Text('TIPO DE PUBLICACION'),
                value: publicacionDetalle.tipo.id,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                items: [
                  ...data.map(
                    (t) => DropdownMenuItem(
                      value: t.id,
                      child: Text(
                        t.nombre,
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(detallePublicacionProvider.notifier)
                        .actualizarTipo(data.where((t) => t.id == value).first);
                  }
                },
              ),
            ),
        error: (_, __) => ElevatedButton(
              onPressed: () {
                ref.invalidate(tiposProvider);
              },
              child: Text(
                'Reintentar cargar tipos',
                style: GoogleFonts.poppins(),
              ),
            ),
        loading: () => const LinearProgressIndicator());
  }
}
