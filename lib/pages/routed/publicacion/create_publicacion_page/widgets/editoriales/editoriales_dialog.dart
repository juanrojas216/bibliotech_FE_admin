import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/services/filtrarEditorial.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/getAllEditorial.controller.dart';
import '../../repository/editorial.repository.dart';
import '../../repository/publicacionDto.repository.dart';

class AlertEditorial extends ConsumerStatefulWidget {
  const AlertEditorial({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlertEditorialState();
}

class _AlertEditorialState extends ConsumerState<AlertEditorial> {
  
  String filtro = '';

  @override
  Widget build(BuildContext context) {
    
    var listaEditoriales = ref.watch(editorialesProvider);

    return AlertDialog(
      title: Column(
        children: [
          const Text('Agregar editorial', textAlign: TextAlign.center),
          const SizedBox(height: 10),
          CupertinoSearchTextField(
            onChanged: (value) {
              filtro = value;
              setState(() {});
            },
          )
        ],
      ),
      content: ref.read(getAllEditorialProvider).when(
            data: (_) {
              
              List<ListTile> items = [];

              for (var e in filtroEditorial(filtro, listaEditoriales)) {
                items.add(
                  ListTile(
                    title: Text(e.nombre, style: GoogleFonts.poppins()),
                    trailing: const Icon(Icons.add),
                    onTap: () {
                      ref.read(publicacionDtoProvider.notifier).addEditorial(e);
                      ref.read(routesProvider).pop();
                    },
                  ),
                );
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
                      ref.invalidate(editorialesProvider);
                    },
                    child: Text('Reintentar cargar editoriales',
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
