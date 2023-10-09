import '../../repository/publicacionDto.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AnioInput extends ConsumerWidget {
  const AnioInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var publicacion = ref.watch(publicacionDtoProvider);
    return TextFormField(
      initialValue: publicacion.anioPublicacion.toString(),
      onChanged: (value) {
        ref
            .read(publicacionDtoProvider.notifier)
            .actualizarAnio(int.tryParse(value));
      },
      decoration: InputDecoration(
          isDense: true,
          labelText: 'AÑO',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
