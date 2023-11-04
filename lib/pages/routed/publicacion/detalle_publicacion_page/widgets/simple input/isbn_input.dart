import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/index.dart';
import '../../repository/publicacion.repository.dart';

class IsbnInput extends ConsumerWidget {

  final Publicacion publicacion;

  const IsbnInput(this.publicacion, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    // var _ = ref.watch(publicacionProvider);

    return TextFormField(
      initialValue: publicacion.isbnPublicacion, //ref.read(publicacionProvider).isbnPublicacion,
      onChanged: (value) => publicacion.isbnPublicacion = value,
          //ref.read(publicacionProvider.notifier).actualizarISBN(value),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'ISBN/ISSN',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
