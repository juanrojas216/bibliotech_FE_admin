import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../repository/detallep.repository.dart';

class TituloInput extends ConsumerWidget {
  const TituloInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var publicacionDetalle = ref.watch(detallePublicacionProvider);

    return TextFormField(
      initialValue: publicacionDetalle.tituloPublicacion,
      onChanged: (value) => ref.read(detallePublicacionProvider.notifier).actualizarTitulo(value),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'TÍTULO',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
