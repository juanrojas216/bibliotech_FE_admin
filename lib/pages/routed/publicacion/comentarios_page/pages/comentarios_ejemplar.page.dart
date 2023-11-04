import 'package:bibliotech_admin/config/router/admin_router.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bibliotech_admin/widgets/eliminar_entidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../widgets/error_mensaje.dart';
import '../controllers/deleteComentario.controller.dart';
import '../controllers/getAllComentariosEjemplar.controller.dart';

class ComentariosEjemplarIndex extends ConsumerStatefulWidget {
  final int idEjemplar;

  const ComentariosEjemplarIndex({required this.idEjemplar, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ComentariosIndexState();
}

class _ComentariosIndexState extends ConsumerState<ComentariosEjemplarIndex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var search =
        ref.watch(getAllComentariosEjemplarProvider(widget.idEjemplar));

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
            data: (comentarios) => Visibility(
              visible: comentarios.isNotEmpty,
              replacement: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hourglass_empty),
                        SizedBox(height: 5),
                        Text("Este ejemplar no posee comentarios"),
                      ],
                    ),
                  ),
                ),
              ),
              child: Column(children: [
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
                                              nombreProvider:
                                                  deleteComentarioProvider(
                                                      c.id),
                                              mensajeResult:
                                                  'COMENTARIO ELIMINADO',
                                              mensajeError:
                                                  'ERROR AL ELIMINAR COMENTARIO'),
                                        );
                                      },
                                      icon: const Icon(Icons.delete)),
                                  title: Text(
                                      'Comentario ${c.id} - Usuario ${c.altaUsuario} - Fecha ${c.fecha} - Calificacion ${c.calificacion}/10',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500)),
                                  subtitle: Text(c.comentario,
                                      style: GoogleFonts.poppins()),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ]),
            ),
            error: (response, _) => ErrorResultadoWidget(
              response: response,
              provider: getAllComentariosEjemplarProvider(widget.idEjemplar),
              message: 'Reintentar cargar comentarios',
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
