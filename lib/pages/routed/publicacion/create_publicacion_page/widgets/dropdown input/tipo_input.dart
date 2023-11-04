import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/error_mensaje.dart';
import '../../controllers/getAllTipoPublicacion.controller.dart';
import '../../repository/tipo_publicacion.repository.dart';
import '../../repository/publicacionDto.repository.dart';


class TipoInput extends ConsumerWidget {
  const TipoInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var publicacionDto = ref.watch(publicacionDtoProvider);
    var tipos = ref.watch(getAllTipoPublicacionProvider);
    
    return tipos.when(
      skipLoadingOnRefresh: false,
        data: (data) => DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<int>(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                isDense: true,
                isExpanded: true,
                hint: const Text('TIPO DE PUBLICACION'),
                value: publicacionDto.tipo?.id,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins.toString(), fontSize: 14),
                items: [
                  ...data.map(
                    (t) => DropdownMenuItem(
                      value: t.id,
                      child: Text(
                        t.nombre,
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(publicacionDtoProvider.notifier)
                        .actualizarTipo(data.where((t) => t.id == value).first);
                  }
                },
              ),
            ),
        // error: (_, __) => ElevatedButton(
        //       onPressed: () {
        //         ref.invalidate(getAllTipoPublicacionProvider);
        //       },
        //       child: Text(
        //         'Reintentar cargar tipos',
        //         style: GoogleFonts.poppins(),
        //       ),
        //     ),
        error: (response, _) => ErrorResultadoWidget(
                  response: response,
                  provider: getAllTipoPublicacionProvider,
                  message: 'Reintentar cargar tipos de publicacion',
              ),
        loading: () => const LinearProgressIndicator());
  }
}
