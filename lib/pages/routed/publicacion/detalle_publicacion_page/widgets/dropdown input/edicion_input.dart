import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/getAllEdicion.controller.dart';
import '../../repository/edicion.repository.dart';
import '../../repository/publicacion.repository.dart';


class EdicionInput extends ConsumerWidget {
  const EdicionInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var publicacionDetalle = ref.watch(publicacionProvider);
    var ediciones = ref.watch(getAllEdicionProvider); 

    return ediciones.when(
      skipLoadingOnRefresh: false,
        data: (data) {
          return DecoratedBox(
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
                value: publicacionDetalle.edicion.id,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                items: [
                  ...ref.read(edicionesProvider).map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(
                        e.nombre,
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(publicacionProvider.notifier)
                        .actualizarEdicion(ref.read(edicionesProvider).where((e) => e.id == value).first);
                  }
                },
              ),
            );
        },
        error: (_, __) => ElevatedButton(
              onPressed: () {
                ref.invalidate(getAllEdicionProvider);
              },
              child: Text(
                'Reintentar cargar ediciones',
                style: GoogleFonts.poppins(),
              ),
            ),
        loading: () => const LinearProgressIndicator());
  }
}
