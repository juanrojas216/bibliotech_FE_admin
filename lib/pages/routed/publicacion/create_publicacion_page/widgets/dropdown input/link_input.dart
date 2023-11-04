import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../../widgets/error_mensaje.dart';
import '../../controllers/getAllPlataforma.controller.dart';
import '../../repository/publicacionDto.repository.dart';
import '../../repository/plataformas.repository.dart';

class LinkInput extends ConsumerWidget {
  const LinkInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var publicacionDto = ref.watch(publicacionDtoProvider);
    var tipos = ref.watch(getAllPlataformasProvider);

    return tipos.when(
        skipLoadingOnRefresh: false,
        data: (data) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                      onPressed: () {
                         ref.read(publicacionDtoProvider.notifier)
                            .resetearLink();
                      },
                      child: Text('Eliminar link', style: GoogleFonts.poppins()),
                    ),
                const SizedBox(width: 10),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<int>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 11),
                      isDense: true,
                      isExpanded: true,
                      hint: const Text('PLATAFORMA'),
                      value: publicacionDto.link.plataformaId,
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 14),
                      items: data.map(
                            (e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(e.nombre),
                            ),
                          ).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          ref
                              .read(publicacionDtoProvider.notifier)
                              .actualizarLinkPlataforma(value);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) => ref
                        .read(publicacionDtoProvider.notifier)
                        .actualizarLinkUrl(value),
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'LINK',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 14),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 11),
                      isDense: true,
                      isExpanded: true,
                      hint: const Text('ESTADO'),
                      value: publicacionDto.link.estado,
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 14),
                      items: const [
                        DropdownMenuItem(
                            value: 'ACTIVO', child: Text('ACTIVO')),
                        DropdownMenuItem(
                            value: 'INACTIVO', child: Text('INACTIVO')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          ref
                              .read(publicacionDtoProvider.notifier)
                              .actualizarLinkEstado(value);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
        // error: (_, __) => ElevatedButton(
        //       onPressed: () {
        //         ref.invalidate(getAllPlataformasProvider);
        //       },
        //       child: Text(
        //         'Reintentar cargar plataformas',
        //         style: GoogleFonts.poppins(),
        //       ),
        //     ),
        error: (response, _) => ErrorResultadoWidget(
                  response: response,
                  provider: getAllPlataformasProvider,
                  message: 'Reintentar cargar plataformas',
              ),
        loading: () => const LinearProgressIndicator());
  }
}
