import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/models/publicaciones.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'widgets/widgets_publicacion.dart';

final entradaBusquedaTituloProvider = StateProvider<String>((ref) {
  return '';
});

final entradaBusquedaAutorProvider = StateProvider<String>((ref) {
  return '';
});

final entradaBusquedaISBNProvider = StateProvider<String>((ref) {
  return '';
});

final entradaBusquedaAnioProvider = StateProvider<String>((ref) {
  return '';
});

final mostrarResultadosProvider = StateProvider<bool>((ref) {
  return false;
});

final tablaResultadosProvider = FutureProvider.autoDispose<Widget>((ref) async {
  if (ref.watch(mostrarResultadosProvider)) {
    var publicaciones = await ref.watch(apiProvider).request<List<Publicacion>>(
          '/publicaciones.json',
          // queryParameters: Map.from({
          //   'titulo': ref.read(entradaBusquedaTituloProvider),
          //   'auto': ref.read(entradaBusquedaAutorProvider),
          //   'anio': ref.read(entradaBusquedaAnioProvider),
          //   'isbn': ref.read(entradaBusquedaISBNProvider),
          // }),
          parser: publicacionFromJson,
        );

    List<PlutoRow> rows = List.generate(
      publicaciones.data!.length,
      (index) => PlutoRow(
        cells: {
          'titulo': PlutoCell(value: publicaciones.data![index].titulo),
          'autor':
              PlutoCell(value: publicaciones.data![index].autores!.join(' - ')),
          'editorial': PlutoCell(
              value: publicaciones.data![index].editoriales!.join(' - ')),
          'edicion': PlutoCell(value: publicaciones.data![index].edicion),
          'anio': PlutoCell(value: publicaciones.data![index].anio),
        },
        sortIdx: index,
      ),
    );

    return TablaPublicaciones(rows: rows);

  } else {

    return const Center();
  
  }

});
