import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../repository/publicacionDto.repository.dart';

class TituloInput extends ConsumerWidget {
  
  const TituloInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var publicacion = ref.watch(publicacionDtoProvider);
   
    return TextFormField(
      initialValue: publicacion.tituloPublicacion,
      onChanged: (value) =>
          ref.read(publicacionDtoProvider.notifier).actualizarTitulo(value),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'TÍTULO',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
