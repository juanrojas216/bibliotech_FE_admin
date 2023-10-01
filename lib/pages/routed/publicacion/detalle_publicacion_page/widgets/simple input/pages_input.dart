import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/repository/publicacionDto.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PagesInput extends ConsumerWidget {
  const PagesInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var _ = ref.watch(publicacionDtoProvider);
    
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (value) => ref.read(publicacionDtoProvider.notifier).actualizarPages(int.parse(value)),
      decoration: InputDecoration(
          isDense: true,
          labelText: 'Número de paginas',
          labelStyle: TextStyle(
              fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
          border: const OutlineInputBorder()),
    );
  }
}
