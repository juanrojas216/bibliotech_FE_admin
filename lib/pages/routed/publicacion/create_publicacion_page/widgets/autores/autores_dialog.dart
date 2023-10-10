

import 'package:bibliotech_admin/config/router/admin_router.dart';
import 'package:bibliotech_admin/pages/routed/publicacion/create_publicacion_page/repository/publicacionDto.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/getAllAutor.controller.dart';
import '../../repository/autores.repository.dart';
import '../../services/filtrarAutor.service.dart';

class AlertAutor extends ConsumerStatefulWidget {
  
  const AlertAutor({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlertAutorState();
}

class _AlertAutorState extends ConsumerState<AlertAutor> {

  String filtro = '';
  
  @override
  Widget build(BuildContext context) {

    var listaAutores = ref.watch(autoresProvider);
    var search = ref.watch(getAllAutoresProvider);
    
    return AlertDialog(
      title: const Column(
        children: [
          Text('Agregar autor', textAlign: TextAlign.center),
          SizedBox(height: 10)
        ],
      ),
      content: search.when(
            
            data: (_) {

              List<ListTile> items = [];

              for (var a in filtroAutor(filtro, listaAutores)) {
                items.add(
                  ListTile(
                    title: Text(a.nombre, style: GoogleFonts.poppins()),
                    trailing: const Icon(Icons.add),
                    onTap: () {
                      ref.read(publicacionDtoProvider.notifier).addAutor(a);
                      ref.read(routesProvider).pop();
                    },
                  ),
                );
              }
              
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                CupertinoSearchTextField(
                  onChanged: (value) {
                    filtro = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 200,
                  width: 500,
                  child: ListView.builder(
                      itemBuilder: (context, index) => items[index],
                      itemCount: items.length),
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
