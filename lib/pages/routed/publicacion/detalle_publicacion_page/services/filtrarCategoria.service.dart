
import 'package:bibliotech_admin/models/index.dart';

List<Categoria> filtrarCategorias(String filtro, List<Categoria> lista){

    
  var categorias = lista;

  for (var c in categorias) {
    c.valores = c.valores
        .where(
            (v) => v.nombre.toLowerCase().contains(filtro.toLowerCase()))
        .toList();
  }

  categorias = categorias.where((e) => e.valores.isNotEmpty).toList();

  return categorias;

}

// List<ListTile> items = [];

//   for (var c in categorias) {
//     items.add(ListTile(
//         title: Text(c.nombre,
//             style: GoogleFonts.poppins(fontWeight: FontWeight.bold))));
//     for (var v in c.valores) {
//       items.add(ListTile(
//         title: Text(v.nombre, style: GoogleFonts.poppins()),
//         trailing: const Icon(Icons.add),
//         onTap: () {
//           ref.read(detallePublicacionProvider.notifier).addCategoria(c, v);
//           ref.read(routesProvider).pop();
//         },
//       ));
//     }
//   }

//   return items;