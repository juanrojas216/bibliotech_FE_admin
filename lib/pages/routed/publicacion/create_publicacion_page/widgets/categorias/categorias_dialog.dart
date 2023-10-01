import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/repository/publicacionDto.repository.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/services/filtrarCategoria.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/getAllCategoria.controller.dart';
import '../../repository/categorias.repository.dart';

class AlertCategoria extends ConsumerStatefulWidget {
  const AlertCategoria({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlertCategoriaState();
}

class _AlertCategoriaState extends ConsumerState<AlertCategoria> {
  String filtro = '';

  @override
  Widget build(BuildContext context) {
    var listaCategoria = ref.watch(categoriasProvider);

    return AlertDialog(
      title: Column(
        children: [
          const Text('Agregar categoría', textAlign: TextAlign.center),
          const SizedBox(height: 10),
          CupertinoSearchTextField(
            onChanged: (value) {
              filtro = value;
              setState(() {});
            },
          ),
        ],
      ),
      content: ref.read(getAllCategoriasProvider).when(
            data: (_) {
              
              List<ListTile> items = [];

              for (var c in filtrarCategorias(filtro, listaCategoria)) {
                items.add(ListTile(
                    title: Text(c.nombre,
                        style:
                            GoogleFonts.poppins(fontWeight: FontWeight.bold))));
                for (var v in c.valores) {
                  items.add(ListTile(
                    title: Text(v.nombre, style: GoogleFonts.poppins()),
                    trailing: const Icon(Icons.add),
                    onTap: () {
                      ref
                          .read(publicacionDtoProvider.notifier)
                          .addCategoria(c, v);
                      ref.read(routesProvider).pop();
                    },
                  ));
                }
              }

              return SizedBox(
                height: 200,
                width: 500,
                child: ListView.builder(
                    itemBuilder: (context, index) => items[index],
                    itemCount: items.length),
              );
            },
            error: (error, stackTrace) => Center(
                child: ElevatedButton(
                    onPressed: () {
                      ref.invalidate(categoriasProvider);
                    },
                    child: Text('Reintentar cargar categorias',
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
