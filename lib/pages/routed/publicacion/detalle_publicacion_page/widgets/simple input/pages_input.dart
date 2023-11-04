import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/index.dart';
import '../../repository/publicacion.repository.dart';

class PagesInput extends ConsumerWidget {
  
  final Publicacion publicacion;
  
  const PagesInput(this.publicacion, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var _ = ref.watch(publicacionProvider);

    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: publicacion.nroPaginas.toString(), //ref.read(publicacionProvider).nroPaginas.toString(),
      onChanged: (value) => publicacion.nroPaginas = int.parse(value),
      // ref
      //     .read(publicacionProvider.notifier)
      //     .actualizarPages(int.parse(value)),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'Número de paginas',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
