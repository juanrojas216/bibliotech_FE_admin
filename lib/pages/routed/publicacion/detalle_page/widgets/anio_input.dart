import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/detalle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AnioInput extends ConsumerWidget {
  const AnioInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var publicacionDetalle = ref.watch(detallePublicacionProvider);

    return TextFormField(
      initialValue: publicacionDetalle.anioPublicacion.toString(),
      onChanged: (value) => ref.read(detallePublicacionProvider.notifier).actualizarAnio(int.parse(value)),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'AÑO',
          labelStyle: TextStyle(fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
