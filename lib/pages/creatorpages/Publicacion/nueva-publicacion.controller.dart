import 'dart:js_interop';

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/new_models/autor.dart';
import 'package:bibliotech_admin/new_models/categoria.dart';
import 'package:bibliotech_admin/new_models/categoria_publicacion.dart';
import 'package:bibliotech_admin/new_models/edicion.dart';
import 'package:bibliotech_admin/new_models/editorial.dart';
import 'package:bibliotech_admin/new_models/link.dart';
import 'package:bibliotech_admin/new_models/plataforma.dart';
// import 'package:bibliotech_admin/models/autor.dart';
// import 'package:bibliotech_admin/models/categoria.dart';
// import 'package:bibliotech_admin/models/ediciones.dart';
// import 'package:bibliotech_admin/models/editoriales.dart';
// import 'package:bibliotech_admin/models/publicacion_detalle.dart';
// import 'package:bibliotech_admin/models/tipos_publicacion.dart';
import 'package:bibliotech_admin/new_models/publicacion.dart';
import 'package:bibliotech_admin/new_models/tipo_publicacion.dart';
import 'package:bibliotech_admin/new_models/valor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detallePublicacionRequestProvider =
    FutureProvider.autoDispose<void>((ref) async {
  var response = await ref.watch(apiProvider).request<Publicacion>(
      '/publicacion_detalle.json',
      parser: publicacionFromJson);

  // if (response.error != null) {
  //   throw response.error!;
  // }

  // ref
  //     .read(detallePublicacionProvider.notifier)
  //     .actualizarDetallePublicacion(response.data!);
});

final guardarPublicacionProvider =
    FutureProvider.autoDispose<bool>((ref) async {
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/publicacion_detalle.json',
        method: HttpMethod.patch,
        body: publicacionToJson(ref.watch(detallePublicacionProvider)),
      );

  if (!response.error.isNull) {
    throw false;
  }

  return true;
});

final detallePublicacionProvider =
    StateNotifierProvider<DetallePublicacionNotifier, Publicacion>((ref) {
  return DetallePublicacionNotifier();
});

class DetallePublicacionNotifier extends StateNotifier<Publicacion> {
  DetallePublicacionNotifier()
      : super(
          Publicacion(
            id: 1,
            anioPublicacion: 200,
            isbnPublicacion: ' ',
            tituloPublicacion: ' ',
            nroPaginas: 1,
            autores: [],
            edicion: Edicion(id: 1, nombre: '1'),
            link: Link(
              id: 1,
              url: '1',
              estado: 'ACTIVO',
              plataforma: Plataforma(
                id: 1,
                nombre: '1',
                url: '1',
                instrucciones: '1',
              ),
            ),
            categorias: [],
            tipo: TipoPublicacion(id: 1, nombre: '1'),
            editoriales: [],
            comentarios: [],
            ejemplares: [],
          ),
        );

  actualizarDetallePublicacion(Publicacion dp) {
    state = dp;
  }

  actualizarAnio(int anio) {
    state = state.copyWith(anioPublicacion: anio);
  }

  actualizarTitulo(String titulo) {
    state = state.copyWith(tituloPublicacion: titulo);
  }

  actualizarISBN(int isbn) {
    state = state.copyWith(isbnPublicacion: isbn.toString());
  }

  actualizarEdicion(Edicion e) {
    state = state.copyWith();
    state.edicion = e;
  }

  actualizarTipo(TipoPublicacion tipo) {
    state = state.copyWith(tipo: tipo);
  }

  addCategoria(Categoria c, Valor v) {
    var categoriaOK = state.categorias.where((ca) => ca.categoria.id == c.id);
    if (categoriaOK.isEmpty) {
      state = state.copyWith(categorias: [
        ...state.categorias,
        CategoriaPublicacion(categoria: c, valores: [v])
      ]);
    } else {
      var valorOk = categoriaOK.first.valores.where((va) => va.id == v.id);
      if (valorOk.isEmpty) {
        categoriaOK.first.valores.add(v);
        state = state.copyWith();
      }
    }
  }

  deleteValor(int categoriaIndex, int valorIndex) {
    state.categorias[categoriaIndex].valores.removeAt(valorIndex);
    if (state.categorias[categoriaIndex].valores.isEmpty) {
      state.categorias.removeAt(categoriaIndex);
    }
    state = state.copyWith();
  }

  addAutor(Autor autor) {
    var autorOk = state.autores.where((a) => a.id == autor.id);
    if (autorOk.isEmpty) {
      state.autores.add(autor);
      state = state.copyWith();
    }
  }

  deleteAutor(int index) {
    state.autores.removeAt(index);
    state = state.copyWith();
  }

  addEditorial(Editorial editorial) {
    var editorialOK = state.editoriales.where((e) => e.id == editorial.id);
    if (editorialOK.isEmpty) {
      state.editoriales.add(editorial);
      state = state.copyWith();
    }
  }

  deleteEditorial(int index) {
    state.editoriales.removeAt(index);
    state = state.copyWith();
  }
}

// PROVEEDORES

// final tiposPublicacionProvider = FutureProvider<List<TipoPublicacion>>((ref) async {
  
//   var response = await ref
//       .watch(apiProvider)
//       .request<List<TipoPublicacion>>('/tipos_publicacion.json', parser: tipoPublicacionFromJson);

//   if (response.error != null) {
//     throw response.error!;
//   }

//   return response.data!;
  
// });

// final autoresProvider = FutureProvider<List<Autor>>((ref) async {
//   await Future.delayed(const Duration(seconds: 5));

//   var response = await ref
//       .watch(apiProvider)
//       .request<List<Autor>>('/ediciones.json', parser: autoresFromJson);

//   if (response.error != null) {
//     throw response.error!;
//   }

//   return response.data!;
// });

// final editorialesProvider = FutureProvider<List<Editorial>>((ref) async {
//   await Future.delayed(const Duration(seconds: 5));

//   var response = await ref
//       .watch(apiProvider)
//       .request<List<Editorial>>('/ediciones.json', parser: editorialesFromJson);

//   if (response.error != null) {
//     throw response.error!;
//   }

//   return response.data!;
// });


// /// The base class for the different types of items the list can contain.
// abstract class ListItem {
//   /// The title line to show in a list item.
//   Widget buildTitle(BuildContext context);

//   /// The subtitle line, if any, to show in a list item.
//   Widget buildSubtitle(BuildContext context);
// }

// /// A ListItem that contains data to display a heading.
// class HeadingItem implements ListItem {
//   final String heading;

//   HeadingItem(this.heading);

//   @override
//   Widget buildTitle(BuildContext context) {
//     return Text(
//       heading,
//       style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//     );
//   }

//   @override
//   Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
// }

// /// A ListItem that contains data to display a message.
// class MessageItem implements ListItem {
//   final String sender;
//   final String body;
//   final int idItem;

//   MessageItem(this.sender, this.body, this.idItem);

//   @override
//   Widget buildTitle(BuildContext context) =>
//       Text(sender, style: GoogleFonts.poppins());

//   // @override
//   // Widget buildSubtitle(BuildContext context) => Text(body);
//   @override
//   Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
// }

// categorias.when(
//     skipLoadingOnRefresh: false,
//     data: (data) => AlertDialog(
//       title: Text('CATEGORÍA', textAlign: TextAlign.center, style: GoogleFonts.poppins()),
//       actionsAlignment: MainAxisAlignment.center,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       content: Container(
//         width: 300,
//         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: ListView.separated(
//           itemBuilder: (_, i) => CategoriaItem(index: i),
//           separatorBuilder: (_, __) => const Divider(),
//           itemCount: data.data!.length,
//         ),
//       ),
//       actions: [
//         ElevatedButton(
//           onPressed: () {},
//           child: Text(
//             'ACTUALIZAR',
//             style: GoogleFonts.poppins(),
//           ),
//         ),
//         const SizedBox(width: 20),
//         ElevatedButton(
//           onPressed: () {},
//           style: const ButtonStyle(
//               backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
//           child: Text(
//             'CANCELAR',
//             style: GoogleFonts.poppins(color: Colors.white),
//           ),
//         ),
//       ],
//     ),
//     error: (_, __) => const SizedBox(),
//     loading: () => AlertDialog(
//       title: Text('CATEGORÍA', textAlign: TextAlign.center, style: GoogleFonts.poppins()),
//       actionsAlignment: MainAxisAlignment.center,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       content: const Center(child: CircularProgressIndicator()),
//     ),