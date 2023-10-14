import 'dart:js_interop';

import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/ejemplares_page/controllers/getAllEjemplares.controller.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/ejemplares_page/repository/ejemplares.repository.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/ejemplares_page/widgets/acciones_ejemplar.dart';
import 'package:bibliotech_admin/widgets/mostrar_usuario.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                      context: context, builder: (context) => EjemplarAdd(idPublicacion: widget.idPublicacion),
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
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('EJEMPLAR ${e.id}',
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                                        Text('ESTADO: ${e.estados.last.nombre}',
                                            style: GoogleFonts.poppins()),
                                        Text('UBICACION: ${e.ubicacion.isNull ? 'No asignada' : e.ubicacion!.descripcion}',
                                            style: GoogleFonts.poppins()),
                                      ],
                                    ),
                                    onTap: () {
                                      accionesEjemplar(context, ref, e.id);
                                    },
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ]),
                error: (__, _) => Center(
                  child: ElevatedButton(
                    child: const Text('Reintentar cargar ejemplares'),
                    onPressed: () {
                      ref.invalidate(
                          getAllEjemplaresProvider(widget.idPublicacion));
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
