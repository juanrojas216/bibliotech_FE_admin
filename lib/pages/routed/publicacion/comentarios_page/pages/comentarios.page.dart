import 'package:bibliotech_admin/config/router/admin_router.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/comentarios_page/controllers/deleteComentario.controller.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/getAllComentarios.controller.dart';

class ComentariosIndex extends ConsumerStatefulWidget {
  final int idPublicacion;

  const ComentariosIndex({required this.idPublicacion, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ComentariosIndexState();
}

class _ComentariosIndexState extends ConsumerState<ComentariosIndex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var search = ref.watch(getAllComentariosProvider(widget.idPublicacion));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        elevation: 0,
        title: AutoSizeText('Comentarios',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          height: 100.h,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border.fromBorderSide(
                BorderSide(color: Colors.grey, width: 2)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: search.when(
                skipLoadingOnRefresh: false,
                data: (comentarios) => Column(children: [
                  const SizedBox(height: 10),
                  Flexible(
                    child: ListView(
                      children: comentarios
                          .map((c) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: ListTile(
                                    trailing: IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => EliminarEntidad(
                                                nombreProvider: deleteComentarioProvider(c.id),
                                                mensajeResult: 'COMENTARIO ELIMINADO',
                                                mensajeError: 'ERROR AL ELIMINAR COMENTARIO'),
                                          );
                                        },
                                        icon: const Icon(Icons.delete)),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Comentario ${c.id} - Usuario ${c.altaUsuario.legajo} - Fecha ${c.fecha} - Calificacion ${c.calificacion}',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    subtitle: Text(c.comentario,
                                        style: GoogleFonts.poppins()),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ]),
                error: (__, _) => Center(
                  child: ElevatedButton(
                    child: const Text('Reintentar cargar comentarios'),
                    onPressed: () {
                      ref.invalidate(getAllComentariosProvider(widget.idPublicacion));
                    },
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
        ),
      ),
    );
  }
}
