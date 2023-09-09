import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../detalle_controller.dart';

class LinkInput extends ConsumerWidget {
  const LinkInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var publicacionDetalle = ref.watch(detallePublicacionProvider);

    return TextFormField(
      initialValue: publicacionDetalle.anio!.toString(),
      onChanged: (value) => ref.read(detallePublicacionProvider.notifier).actualizarAnio(int.parse(value)),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'LINK',
          labelStyle: TextStyle(fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}