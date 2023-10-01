import 'package:bibliotech_admin/pages/parametrospages/plataforma/controllers/getAllPlataforma.controller.dart';
import 'package:bibliotech_admin/pages/parametrospages/plataforma/repository/plataformas.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../repository/publicacion.repository.dart';

class LinkInput extends ConsumerWidget {
  const LinkInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var publicacionDto = ref.watch(publicacionProvider);
    var tipos = ref.watch(getAllPlataformasProvider);

    return tipos.when(
        skipLoadingOnRefresh: false,
        data: (_) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                      value: publicacionDto.link.plataforma.id,
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins.toString(),
                          fontSize: 14),
                      items: ref.read(plataformasProvider).map(
                            (e) => DropdownMenuItem(
                              value: e.id,
                              child: Text(e.nombre),
                            ),
                          ).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          ref
                              .read(publicacionProvider.notifier)
                              .actualizarLinkPlataforma(ref.read(plataformasProvider).firstWhere((p) => p.id == value));
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) => ref
                        .read(publicacionProvider.notifier)
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
                              .read(publicacionProvider.notifier)
                              .actualizarLinkEstado(value);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
        error: (_, __) => ElevatedButton(
              onPressed: () {
                ref.invalidate(getAllPlataformasProvider);
              },
              child: Text(
                'Reintentar cargar plataformas',
                style: GoogleFonts.poppins(),
              ),
            ),
        loading: () => const LinearProgressIndicator());
  }
}
