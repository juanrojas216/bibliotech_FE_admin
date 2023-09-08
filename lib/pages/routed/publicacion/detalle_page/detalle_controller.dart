import 'dart:js_interop';

import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:bibliotech_admin/config/helpers/http_method.dart';
import 'package:bibliotech_admin/models/autor.dart';
import 'package:bibliotech_admin/models/categoria.dart';
import 'package:bibliotech_admin/models/ediciones.dart';
import 'package:bibliotech_admin/models/editoriales.dart';
import 'package:bibliotech_admin/models/publicacion_detalle.dart';
import 'package:bibliotech_admin/models/tipos_publicacion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detallePublicacionRequestProvider = FutureProvider.autoDispose<void>((ref) async {
  var response = await ref.watch(apiProvider).request<PublicacionDetalle>(
      '/publicacion_detalle.json',
      parser: publicacionDetalleFromJson);

  if (response.error != null) {
    throw response.error!;
  }

  ref
      .read(detallePublicacionProvider.notifier)
      .actualizarDetallePublicacion(response.data!);
});

final guardarPublicacionProvider = FutureProvider.autoDispose<bool>((ref) async {
  
  var response = await ref.watch(apiProvider).request<dynamic>(
        '/publicacion_detalle.json',
        method: HttpMethod.patch,
        body: publicacionDetalleToJson(ref.watch(detallePublicacionProvider)),
  );


  if (!response.error.isNull) {
    throw false;
  }

  return true;

});

final detallePublicacionProvider =
    StateNotifierProvider<DetallePublicacionNotifier, PublicacionDetalle>(
        (ref) {
  return DetallePublicacionNotifier();
});

class DetallePublicacionNotifier extends StateNotifier<PublicacionDetalle> {
  DetallePublicacionNotifier() : super(PublicacionDetalle(anio: 200));

  actualizarDetallePublicacion(PublicacionDetalle dp) {
    state = dp;
  }

  actualizarAnio(int anio) {
    state = state.copyWith(anio: anio);
  }

  actualizarTitulo(String titulo) {
    state = state.copyWith(titulo: titulo);
  }

  actualizarISBN(int isbn) {
    state = state.copyWith(isbn: isbn);
  }

  actualizarEdicion(Edicion edicion) {
    state = state.copyWith(edicion: edicion);
  }

  actualizarTipo(TipoPublicacion tipo) {
    state = state.copyWith(tipo: tipo);
  }

  addCategoria(Categoria c, Valor v) {
    var categoriaOK =
        state.categorias!.where((ca) => ca.idCategoria == c.idCategoria);
    if (categoriaOK.isEmpty) {
      state = state.copyWith(categorias: [...state.categorias!, c]);
      state.categorias!.last.valores = [v];
    } else {
      var valorOk =
          categoriaOK.first.valores.where((va) => va.idValor == v.idValor);
      if (valorOk.isEmpty) {
        categoriaOK.first.valores.add(v);
        state = state.copyWith();
      }
    }
  }

  deleteValor(int categoriaIndex, int valorIndex) {
    state.categorias![categoriaIndex].valores.removeAt(valorIndex);
    if (state.categorias![categoriaIndex].valores.isEmpty) {
      state.categorias!.removeAt(categoriaIndex);
    }
    state = state.copyWith();
  }

  addAutor(Autor autor) {
    var autorOk = state.autores!.where((a) => a.id == autor.id);
    if (autorOk.isEmpty) {
      state.autores!.add(autor);
      state = state.copyWith();
    }
  }

  deleteAutor(int index) {
    state.autores!.removeAt(index);
    state = state.copyWith();
  }

  addEditorial(Editorial editorial) {
    var editorialOK = state.editoriales!.where((e) => e.id == editorial.id);
    if (editorialOK.isEmpty) {
      state.editoriales!.add(editorial);
      state = state.copyWith();
    }
  }

  deleteEditorial(int index) {
    state.editoriales!.removeAt(index);
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