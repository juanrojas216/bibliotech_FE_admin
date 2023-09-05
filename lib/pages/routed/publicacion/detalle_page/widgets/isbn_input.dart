import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../detalle_controller.dart';

class IsbnInput extends ConsumerWidget {
  const IsbnInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var publicacionDetalle = ref.watch(detallePublicacionProvider);
    
    return TextFormField(
      initialValue: publicacionDetalle.isbn!.toString(),
      onChanged: (value) => ref.read(detallePublicacionProvider.notifier).actualizarISBN(int.parse(value)),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'ISBN/ISSN',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}