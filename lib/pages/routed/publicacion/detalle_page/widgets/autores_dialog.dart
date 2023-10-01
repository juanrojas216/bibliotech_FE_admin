import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/parametrospages/autor/controllers/getAllAutor.controller.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/detalle_page/services/filtrarAutor.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../repository/autores.repository.dart';
import '../repository/detallep.repository.dart';

class AlertAutor extends ConsumerStatefulWidget {
  const AlertAutor({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlertAutorState();
}

class _AlertAutorState extends ConsumerState<AlertAutor> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Column(
        children: [
          Text('Agregar autor', textAlign: TextAlign.center),
          SizedBox(height: 10)
        ],
      ),
      content: ref.read(getAllAutoresProvider).when(
            data: (_) {

              var listaAutores = ref.read(autoresProvider);
              List<ListTile> items = [];

              for (var a in listaAutores) {
                items.add(
                  ListTile(
                    title: Text(a.nombre, style: GoogleFonts.poppins()),
                    trailing: const Icon(Icons.add),
                    onTap: () {
                      ref.read(detallePublicacionProvider.notifier).addAutor(a);
                      ref.read(routesProvider).pop();
                    },
                  ),
                );
              }
              
              return Column(children: [
                CupertinoSearchTextField(
                  onChanged: (value) {
                    listaAutores = filtroAutor(value, listaAutores);
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 200,
                  width: 500,
                  child: ListView.builder(
                      itemBuilder: (context, index) => items[index],
                      itemCount: listaAutores.length),
                ),
              ]);
            },
            error: (error, stackTrace) => Center(
                child: ElevatedButton(
                    onPressed: () {
                      ref.invalidate(autoresProvider);
                    },
                    child: Text('Reintentar cargar autores',
                        style: GoogleFonts.poppins()))),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
      actions: [
        ElevatedButton(
            onPressed: () => ref.read(routesProvider).pop(),
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
            child: Text('Cancelar', style: GoogleFonts.poppins()))
      ],
    );
  }
}
