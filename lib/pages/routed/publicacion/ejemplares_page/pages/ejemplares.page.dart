import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/widgets/mostrar_usuario.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../widgets/error_mensaje.dart';
import '../controllers/getAllEjemplares.controller.dart';
import '../widgets/acciones_ejemplar.dart';
import 'addEjemplar.page.dart';

class EjemplaresIndex extends ConsumerStatefulWidget {
  final int idPublicacion;

  const EjemplaresIndex({required this.idPublicacion, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AutoresIndexState();
}

class _AutoresIndexState extends ConsumerState<EjemplaresIndex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var search = ref.watch(getAllEjemplaresProvider(widget.idPublicacion));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ref.read(routesProvider).pop();
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        elevation: 0,
        title: AutoSizeText('Ejemplares',
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        EjemplarAdd(idPublicacion: widget.idPublicacion),
                  );
                },
                child: const Text('Nuevo ejemplar')),
          ),
          const SizedBox(width: 20),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(child: MostrarUsuario()),
          ),
          const SizedBox(width: 20),
        ],
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
            data: (ejemplares) => Column(children: [
              const SizedBox(height: 10),
              Flexible(
                child: ListView(
                  children: ejemplares
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16)),
                              child: ListTile(
                                trailing: const Icon(Icons.more_vert),
                                title: Text(
                                    'EJEMPLAR: ${e.id} - ISBN: ${e.serialNfc}',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500)),
                                subtitle: Text(
                                    'ESTADO: ${e.estado} - VALORACIÓN: ${e.valoracion}/10 - UBICACIÓN: ${e.ubicacion.descripcion}',
                                    style: GoogleFonts.poppins()),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          accionesEjemplar(context, ref, e));
                                },
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            ]),
            error: (response, _) => ErrorResultadoWidget(
              response: response,
              provider: getAllEjemplaresProvider(widget.idPublicacion),
              message: 'Reintentar cargar ejemplares',
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
