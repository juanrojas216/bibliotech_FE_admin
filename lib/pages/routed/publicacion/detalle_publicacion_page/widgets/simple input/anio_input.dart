import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../models/index.dart';
import '../../repository/publicacion.repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AnioInput extends ConsumerWidget {

  final Publicacion publicacion;
  
  const AnioInput(this.publicacion, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // var _ = ref.watch(publicacionProvider);

    return TextFormField(
      initialValue: publicacion.anioPublicacion.toString(), //ref.read(publicacionProvider).anioPublicacion.toString(),
      onChanged: (value) {
        publicacion.anioPublicacion = int.parse(value);
        // ref.read(publicacionProvider.notifier).actualizarAnio(int.parse(value));
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
