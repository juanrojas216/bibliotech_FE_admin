import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/repository/publicacionDto.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class IsbnInput extends ConsumerWidget {
  const IsbnInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var _ = ref.watch(publicacionDtoProvider);
    
    return TextFormField(
      onChanged: (value) => ref.read(publicacionDtoProvider.notifier).actualizarISBN(value),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'ISBN/ISSN',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
