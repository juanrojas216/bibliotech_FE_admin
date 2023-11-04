import 'package:bibliotech_admin/models/publicacion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../repository/publicacion.repository.dart';

class TituloInput extends ConsumerWidget {

  final Publicacion publicacion;
  
  const TituloInput(this.publicacion, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var _ = ref.watch(publicacionProvider);
    return TextFormField(
      initialValue: publicacion.tituloPublicacion,//ref.read(publicacionProvider).tituloPublicacion,
      onChanged: (value) => publicacion.tituloPublicacion = value,
          // ref.read(publicacionProvider.notifier).actualizarTitulo(value),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'TÍTULO',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
